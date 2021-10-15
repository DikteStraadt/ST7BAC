import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/homePage.dart';
import 'package:flutter_project_1_0/screens/newPlan.dart';
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
          padding: EdgeInsets.all(8),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 125,
            width: MediaQuery.of(context).size.width * 0.95,
            child: ListTile(
              tileColor: Colors.green[200],
              title: Text(title),
            ),
          ),
        ),
      ],
    );
  }

  void addNewPlan() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPlan()),
    );

    Plan p = new Plan(result);
    plans.add(new Plan(result));

    setState(() {
      buildContainer(p.title);
    });
  }
}
