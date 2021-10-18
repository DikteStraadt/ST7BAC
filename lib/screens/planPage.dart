import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/homePage.dart';
import 'package:flutter_project_1_0/screens/newPlanPage.dart';
import 'package:flutter_project_1_0/models/plan.dart';

class PlanPage extends StatefulWidget {
  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  List<Plan> plans = [];

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
                addNewPlan();
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
          children: <Widget>[for (var p in plans) buildContainer(p.title)],
        ),
      ),
    );
  }

  Column buildContainer(String title) {
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
                children: [
                  ListTile(
                    leading: Image.asset("lib/assets/vegetar-spaghetti.jpg",
                        fit: BoxFit.fill),
                    tileColor: Colors.lightGreenAccent[100],
                    title: Text(title),
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
                          onTap: () {editPlan();},
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
                          onTap: () {goToViewList();},
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
                          onTap: () {deletePlan("Uge 31");},
                          // value: 3,
                        ),
                      ],
                    ),
                    subtitle: Text(
                        'A sufficiently long subtitle warrants three lines.'),
                    isThreeLine: true,
                  ),
                ],
              )),
        ),
      ],
    );
  }

  void addNewPlan() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPlanPage()),
    );

    Plan p = new Plan(result);
    plans.add(new Plan(result));

    setState(() {
      buildContainer(p.title);
    });
  }

  void goToViewList() {

  }

  void deletePlan(String title) {
    setState(() {
      plans.removeWhere((item) => item.title == title);
    });
  }

  void editPlan() {
  }
}
