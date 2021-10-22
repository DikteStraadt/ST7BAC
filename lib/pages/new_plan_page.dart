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
        child: Column(
          children: <Widget>[
            Text("Giv din nye maplan et navn..."),
            TextField(
              controller: _textController,
            ),
            ElevatedButton(
              onPressed: () {
                  List<Ingredient> l = [];
                  List<Recipe> r = [];
                  l.add(new Ingredient("name", 3.0, "unit"));   
                  r.add(new Recipe("Por-rer-r", "Mecikansk", "picture.jpg", 2, l));               
                Repository.setPlan(
                  new Plan(_currentUser, _textController.text, r),
                ); // Writing new plan to database
                Navigator.pop(context);
              },
              child: Text('Opret madplan'),
            ),
          ],
        ),
      ),
    );
  }

  void setCurrentUser(User value) {
    _currentUser = value.id;
  }
}
