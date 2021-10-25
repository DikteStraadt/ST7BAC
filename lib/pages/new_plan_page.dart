import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/models/user.dart';

class NewPlanPage extends StatelessWidget {
  NewPlanPage({Key? key}) : super(key: key);

  final _textController = TextEditingController();
  String _currentUser = "9xNt9mjHGjMPeWx54dutlamCzRC2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    l.add(new Ingredient("name", 3.0, "unit"));
                    r.add(new Recipe(
                        "Por-rer-r",
                        "Mecikansk",
                        "lib/assets/home/opskrifter.JPG",
                        "prep",
                        "total",
                        2,
                        2,
                        l,
                        "rnelfnonero"));
                    Repository.setPlan(
                      new Plan(_currentUser, _textController.text, r),
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
    );
  }

  void setCurrentUser(User value) {
    _currentUser = value.id;
  }
}
