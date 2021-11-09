import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/models/recipe.dart';

class NewPlanPage extends StatefulWidget {
  @override
  _NewPlanPageState createState() => _NewPlanPageState();
}

class _NewPlanPageState extends State<NewPlanPage> {
  final _textController = TextEditingController();
  final User? _currentUser = FirebaseAuth.instance.currentUser;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Opret ny maplan"),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.fromLTRB(10, 2, 1, 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.black)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Giv din madplan et navn",
                        errorText:
                            _validate ? 'Feltet må ikke være tomt' : null,
                      ),
                      controller: _textController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _textController.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                      if (_validate == false) {
                        List<Ingredient> l = [];
                        List<Recipe> r = [];
                        l.add(new Ingredient("", 0, ""));
                        r.add(new Recipe("", "", "", "", "", 0, 0, l, ""));
                        Repository.setPlan(
                          new Plan(_currentUser!.uid.toString(),
                              _textController.text, []),
                        ); // Writing new plan to database
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Opret madplan',
                        style: TextStyle(
                            color: Color(0xfff001c7c),
                            fontSize: MediaQuery.of(context).size.width * 0.05,
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
          ),
        ),
      ),
    );
  }
}
