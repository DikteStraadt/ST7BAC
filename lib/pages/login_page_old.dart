import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_1_0/login/fire_auth.dart';
import 'package:flutter_project_1_0/login/validator.dart';
import 'package:flutter_project_1_0/pages/registre_page.dart';

class LoginPageOld extends StatefulWidget {
  @override
  _LoginPageOldState createState() => _LoginPageOldState();
}

class _LoginPageOldState extends State<LoginPageOld> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushNamed(context, 'home');
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: GestureDetector(
        onTap: () {
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hånd i hånd'),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: _initializeFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.1),
                          Text(
                            'Hånd i hånd',
                            style: TextStyle(
                                color: Color(0xfff001c7c),
                                fontFamily: 'Margarine',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.13),
                            textAlign: TextAlign.center,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.1),
                                TextFormField(
                                  controller: _emailTextController,
                                  focusNode: _focusEmail,
                                  validator: (value) => Validator.validateEmail(
                                    email: value.toString(),
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "E-mail",
                                    errorBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                TextFormField(
                                  controller: _passwordTextController,
                                  focusNode: _focusPassword,
                                  obscureText: true,
                                  validator: (value) =>
                                      Validator.validatePassword(
                                    password: value.toString(),
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Kodeord",
                                    errorBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.0),
                                _isProcessing
                                    ? CircularProgressIndicator()
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                _focusEmail.unfocus();
                                                _focusPassword.unfocus();

                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  setState(() {
                                                    _isProcessing = true;
                                                  });

                                                  User? user = await FireAuth
                                                      .signInUsingEmailPassword(
                                                    email: _emailTextController
                                                        .text,
                                                    password:
                                                        _passwordTextController
                                                            .text,
                                                    context: context,
                                                  );

                                                  setState(() {
                                                    _isProcessing = false;
                                                  });

                                                  if (user != null) {
                                                    Navigator.pushNamed(
                                                        context, 'home');
                                                  }
                                                }
                                              },
                                              child: Text('Log ind',
                                                  style: TextStyle(
                                                      color: Color(0xfff001c7c),
                                                      fontSize: 18,
                                                      fontFamily: 'Margarine')),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                side: BorderSide(
                                                  width: 2.0,
                                                  color: Color(0xfff001c7c),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 24.0),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage(),
                                                  ),
                                                );
                                              },
                                              child: Text('Registrer',
                                                  style: TextStyle(
                                                      color: Color(0xfff001c7c),
                                                      fontSize: 18,
                                                      fontFamily: 'Margarine')),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                side: BorderSide(
                                                  width: 2.0,
                                                  color: Color(0xfff001c7c),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
