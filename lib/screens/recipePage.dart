import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/homePage.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opskrifter"),
        leading: GestureDetector(
          onTap: () {Navigator.pop(context);},
          child: Icon(
            Icons.home_outlined,
            size: 30,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {/* Write listener code here */},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
      ),
    );
  }
}
