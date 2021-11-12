import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';
import 'package:flutter_project_1_0/utilities/navigation.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

class SelectPlanPage extends StatefulWidget {
  @override
  State<SelectPlanPage> createState() => _SelectPlanPageState();
  const SelectPlanPage({Key? key, required this.recipe, required this.route})
      : super(key: key);

  final Recipe recipe;
  final String route;
}

class _SelectPlanPageState extends State<SelectPlanPage> {
  List<Plan> _plans = [];
  User? _currentUser = FirebaseAuth.instance.currentUser;
  List<Map<String, String>> recipes = [];
  String output = "";

  @override
  void initState() {
    Repository.getPlanNames(_currentUser!.uid.toString()).then(getPlans);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        goBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Madplaner'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              goBack();
            },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[for (var p in _plans) buildContainer(p)],
                ),
              ),
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
          fit: BoxFit.fill),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      selectedTileColor: Color(0xfff001c7c),
      title: Text(plan.title),
      trailing: GestureDetector(
        onTap: () {
          MySnackbar snackbar = new MySnackbar();
          snackbar.addToPlanSnackBar(context);
          Repository.addRecipeToPlan(plan, widget.recipe);
          goBack();
        },
        child: Icon(
          Icons.add_outlined,
          size: 50,
        ),
      ),
      subtitle: Text(printContent(plan)),
      isThreeLine: true,
    );
  }

  getPlans(Map plansNames) {
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

  void goBack() {
    if (widget.route == "f" || widget.route == "r") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RecipePage(recipe: widget.recipe, route: widget.route),
        ),
      );
    } else if (widget.route == "rr") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationController(initpage: 0),
        ),
      );
    } else if (widget.route == "ff") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationController(initpage: 2),
        ),
      );
    }
  }
}
