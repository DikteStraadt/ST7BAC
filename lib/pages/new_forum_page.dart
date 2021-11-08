import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/list_entry.dart';
import 'package:uuid/uuid.dart';

class NewForumPage extends StatefulWidget {
  @override
  _NewForumPageState createState() => _NewForumPageState();
}

class _NewForumPageState extends State<NewForumPage> {
  final _textTitleController = TextEditingController();
  final _textQuestionController = TextEditingController();
  final User? _currentUser = FirebaseAuth.instance.currentUser;
  bool _validate_title = false;
  bool _validate_question = false;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Opret nyt indlæg"),
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Giv indlægget en titel",
                            errorText: _validate_title
                                ? 'Feltet må ikke være tomt'
                                : null,
                          ),
                          controller: _textTitleController,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05),
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
                            labelText: "Skriv dit spørgsmål",
                            errorText: _validate_question
                                ? 'Feltet må ikke være tomt'
                                : null,
                          ),
                          controller: _textQuestionController,
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
                        _textTitleController.text.isEmpty
                            ? _validate_title = true
                            : _validate_title = false;

                        _textQuestionController.text.isEmpty
                            ? _validate_question = true
                            : _validate_question = false;
                      });
                      if (_validate_title == false &&
                          _validate_question == false) {
                        Repository.setForum(
                          new ListEntry(
                              Uuid().v4(),
                              _textTitleController.text,
                              _textQuestionController.text,
                              DateTime.now().toString(),
                              _currentUser!.displayName,
                              0,
                              0),
                        ); // Writing new plan to database
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Opret indlæg',
                      style: TextStyle(
                          color: Color(0xfff001c7c),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontFamily: 'Margarine'),
                    ),
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
