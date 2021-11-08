import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/list_entry.dart';
import 'package:uuid/uuid.dart';

class NewForumPage extends StatelessWidget {
  NewForumPage({Key? key}) : super(key: key);

  final _textTitleController = TextEditingController();
  final _textQuestionController = TextEditingController();
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Navigator.maybePop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Opret nyt indlæg"),
          backgroundColor: Colors.teal[600],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.teal[100]),
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
                    },
                    child: Text(
                      'Opret indlæg',
                      style: TextStyle(
                          fontFamily: 'Margarine',
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[600],
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
