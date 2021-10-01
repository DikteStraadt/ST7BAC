import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/models/loginData.dart';

class PlanPage extends StatefulWidget {
  final LoginData data;

  PlanPage({required this.data});

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
            Text(widget.data.emailValue),
            Text(widget.data.passwordValue),
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
