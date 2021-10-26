import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

class SelectPlanPage extends StatefulWidget {
  @override
  State<SelectPlanPage> createState() => _SelectPlanPageState();
  const SelectPlanPage({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;
}

class _SelectPlanPageState extends State<SelectPlanPage> {
  List<Plan> _plans = [];
  User? _currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Repository.getPlans(_currentUser!.uid.toString()).then(updatePlans);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Madplaner'),
        backgroundColor: Colors.teal[600],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipePage(recipe: widget.recipe),
              ),
            );
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
              : "lib/assets/recipe/opskrifter.JPG",
          fit: BoxFit.fill),
      tileColor: Colors.teal[300],
      title: Text(plan.title),
      trailing: GestureDetector(
        onTap: () {
                    mySnackbar snackbar = new mySnackbar();
          snackbar.addToPlanSnackBar(context);
          Repository.addRecipeToPlan(plan, widget.recipe);
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => RecipePage(recipe: widget.recipe)))
              .then((value) {});

        },
        child: Icon(
          Icons.add_outlined,
          size: 50,
        ),
      ),
      subtitle: Text(""),
      isThreeLine: true,
    );
  }

  updatePlans(Map plans) {
    List<Plan> planList = [];

    List<Ingredient> l = [];
    List<Recipe> r = [];
    l.add(new Ingredient("name", 3.0, "unit"));
    r.add(new Recipe("Por-rer-r", "Mecikansk", "lib/assets/home/opskrifter.JPG",
        "prep", "total", 2, 2, l, "rnelfnonero"));

    plans.forEach(
      (key, value) {
        planList.add(
          new Plan(_currentUser!.uid.toString(), key, r),
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
