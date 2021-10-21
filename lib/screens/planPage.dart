import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/models/user.dart';
import 'package:flutter_project_1_0/screens/homePage.dart';
import 'package:flutter_project_1_0/screens/newPlanPage.dart';
import 'package:flutter_project_1_0/models/plan.dart';

class PlanPage extends StatefulWidget {
  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  List<Plan> _plans = [];
  String _currentUser = "9xNt9mjHGjMPeWx54dutlamCzRC2";

  @override
  void initState() {
    Repository.getCurrentUser()
        .then(setCurrentUser); // Get current user from database
    Repository.getPlans(_currentUser).then(updatePlans);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Madplaner'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => HomePage(),
              ),
            );
            Navigator.of(context).pop(true);
          },
          child: Icon(
            Icons.home_outlined,
            size: 28,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (_) => NewPlanPage()))
                    .then((value) {
                  Repository.getPlans(_currentUser).then(updatePlans);
                });
              },
              child: Icon(
                Icons.add_outlined,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[for (var p in _plans) buildContainer(p)],
        ),
      ),
    );
  }

  Column buildContainer(Plan plan) {
    return new Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(7),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.94,
              child: Column(
                children: [_buildListTile(plan)],
              )),
        ),
      ],
    );
  }

  Widget _buildListTile(Plan plan) {
    return ListTile(
      leading: Image.asset(
          plan.recipesList.isNotEmpty
              ? plan.recipesList[0].picture
              : "lib/assets/aesel.jpg",
          fit: BoxFit.fill),
      tileColor: Colors.lightGreenAccent[100],
      title: Text(plan.title),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.edit_rounded,
                ),
                SizedBox(width: 10.0),
                Text("Rediger madplan"),
              ],
            ),
            onTap: () {
              //editPlan();
            },
            // value: 1,
          ),
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.format_list_bulleted_rounded,
                ),
                SizedBox(width: 10.0),
                Text("Se indkøbsliste"),
              ],
            ),
            onTap: () {
              //goToViewList();
            },
            // value: 2,
          ),
          PopupMenuItem(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.delete,
                ),
                SizedBox(width: 10.0),
                Text("Slet madplan"),
              ],
            ),
            onTap: () {
              Repository.removePlan(plan); // Removes plan from database
              Repository.getPlans(_currentUser).then(updatePlans);
            },
            // value: 3,
          ),
        ],
      ),
      subtitle: Text(""),
      isThreeLine: true,
    );
  }

  void setCurrentUser(User value) {
    setState(() {
      _currentUser = value.id;
    });
  }

  // void addNewPlan() async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => NewPlanPage()),
  //   );

  //   Plan p = new Plan(result);
  //   plans.add(new Plan(result));

  //   setState(() {
  //     buildContainer(p.title);
  //   });
  // }

  // void goToViewList() {}

  // void deletePlan(String title) {
  //   // setState(() {
  //   //   plans.removeWhere((item) => item.title == title);
  //   // });
  // }

  // void editPlan() {}

  updatePlans(Map plans) {
    List<Plan> planList = [];

    List<Ingredient> l = [];
    List<Recipe> r = [];
    l.add(new Ingredient("name", 3.0, "unit"));
    r.add(new Recipe(
        "Por-rer-r", "Mecikansk", "lib/assets/mexicansk-risret.jpg", 2, l));

    plans.forEach(
      (key, value) {
        planList.add(
          new Plan(_currentUser, key, r),
        );
      },
    );

    setState(
      () {
        _plans = planList;
      },
    );
  }
}
