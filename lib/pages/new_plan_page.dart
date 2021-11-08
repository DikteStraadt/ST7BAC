import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/models/recipe.dart';

class NewPlanPage extends StatelessWidget {
  NewPlanPage({Key? key}) : super(key: key);

  final _textController = TextEditingController();
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
          title: Text("Opret ny maplan"),
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
                      List<Ingredient> l = [];
                      List<Recipe> r = [];
                      l.add(new Ingredient("", 0, ""));
                      r.add(new Recipe("", "", "", "", "", 0, 0, l, ""));
                      Repository.setPlan(
                        new Plan(_currentUser!.uid.toString(),
                            _textController.text, []),
                      ); // Writing new plan to database
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Opret madplan',
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
