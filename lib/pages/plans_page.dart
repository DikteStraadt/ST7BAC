import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/pages/home_page.dart';
import 'package:flutter_project_1_0/pages/new_plan_page.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

class PlanPage extends StatefulWidget {
  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  List<Plan> _plans = [];
  User? _currentUser = FirebaseAuth.instance.currentUser;
  String output = "";

  @override
  void initState() {
    Repository.getPlanNames(_currentUser!.uid.toString()).then(getPlans);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Madplaner'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'home');
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
                  Repository.getPlanNames(_currentUser!.uid.toString())
                      .then(getPlans);
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
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              for (var p in _plans) buildContainer(p),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
            ],
          ),
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
      contentPadding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.05,
          MediaQuery.of(context).size.width * 0.02,
          0,
          0),
      leading: Image.asset(
          plan.recipesList.isNotEmpty
              ? plan.recipesList[0]["picture"].toString()
              : "lib/assets/home/opskrifter.JPG",
          fit: BoxFit.fitHeight),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      selectedTileColor: Color(0xfff001c7c),
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
              MySnackbar snackbar = new MySnackbar();
              snackbar.notImplementedSnackBar(context);
            },
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
              MySnackbar snackbar = new MySnackbar();
              snackbar.notImplementedSnackBar(context);
            },
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
              Repository.getPlanNames(_currentUser!.uid.toString())
                  .then(getPlans);
            },
          ),
        ],
      ),
      subtitle: Text(printContent(plan)),
      isThreeLine: true,
    );
  }

  getPlans(Map plansNames) {
    _plans.clear();
    plansNames.forEach(
      //get all plans
      (key, value) {
        Repository.getPlanRecipes(_currentUser!.uid.toString(), key)
            .then(getRecipes); //get all recipes
      },
    );
  }

  getRecipes(Map planRecipes) {
    int i = planRecipes.length;
    int j = 0;
    String title = "";
    List<Map<String, String>> recipes = [];

    planRecipes.forEach(
      (key, value) {
        j++;
        if (j < i) {
          Map<String, String> map = {};
          map["name"] = value['name'];
          map["picture"] = value['picture'];
          recipes.add(map);
        } else {
          title = value;
        }
      },
    );

    setState(
      () {
        _plans.add(new Plan(_currentUser!.uid.toString(), title, recipes));
      },
    );
  }

  String printContent(Plan plan) {
    output = "";

    plan.recipesList.forEach(
      (element) {
        if (element["name"].toString() != "null") {
          output += element["name"].toString() + "\n";
        }
      },
    );

    return output;
  }
}
