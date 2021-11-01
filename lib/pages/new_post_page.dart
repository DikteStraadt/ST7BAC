import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/form_post_entry.dart';

class NewPostPage extends StatelessWidget {
  NewPostPage({Key? key, required this.id}) : super(key: key);

  final _textAnswerController = TextEditingController();
  User? _currentUser = FirebaseAuth.instance.currentUser;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opret nyt forum"),
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
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Skriv et forumindlæg",
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
                    Repository.setPost(new ForumPostEntry(id, _currentUser!.displayName, DateTime.now().toString(), 0,0, _textAnswerController.text),); // Writing new post to database
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Send svar',
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
    );
  }
}
