import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/form_post_entry.dart';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
  NewPostPage({Key? key, required this.id}) : super(key: key);
  final String id;
}

class _NewPostPageState extends State<NewPostPage> {
  final _textAnswerController = TextEditingController();
  final User? _currentUser = FirebaseAuth.instance.currentUser;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Navigator.maybePop(context);

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Skriv svar til indlæg"),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: EdgeInsets.fromLTRB(10, 2, 1, 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.black)),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Skriv et svar",
                            errorText:
                                _validate ? 'Feltet må ikke være tomt' : null,
                          ),
                          controller: _textAnswerController,
                        ),
                      ),
                    ],
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
                        _textAnswerController.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                      if (_validate == false) {
                        Repository.setPost(
                          new ForumPostEntry(
                              widget.id,
                              _currentUser!.displayName,
                              DateTime.now().toString(),
                              0,
                              _textAnswerController.text),
                        ); // Writing new post to database
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Send svar',
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
