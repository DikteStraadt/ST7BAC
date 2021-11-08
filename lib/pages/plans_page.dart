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
                  Repository.getPlans(_currentUser!.uid.toString())
                      .then(updatePlans);
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
              ? "lib/assets/recipe/" + plan.recipesList[0] + ".png"
              : "lib/assets/home/opskrifter.JPG",
          fit: BoxFit.fill),
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
              Repository.getPlans(_currentUser!.uid.toString())
                  .then(updatePlans);
            },
          ),
        ],
      ),
      subtitle: Text(printContent(plan)),
      isThreeLine: true,
    );
  }

  updatePlans(Map plans) {
    List<Plan> planList = [];

    plans.forEach(
      (key, value) {
        // print("key:" + key);
        // // print("value:" + value['title']['title']);
        // planList.add(
        //   new Plan(_currentUser!.uid.toString(), value['title'], ["mexicansk-risret", "one-pot-pasta"]),
        // );
      },
    );

    setState(
      () {
        _plans = planList;
      },
    );
  }

  String printContent(Plan plan) {
    String string = "";

    for (String r in plan.recipesList) {
      string += r + "\n\n";
    }

    return string;
  }
}
