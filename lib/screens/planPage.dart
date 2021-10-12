import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text("Madplaner"),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tilbage'),
            ),
          ],
        )));
  }
}
