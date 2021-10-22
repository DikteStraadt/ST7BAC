import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XXXXX"),
        backgroundColor: Colors.teal[600],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.teal[100]),
        // child: Container(
        //   margin: const EdgeInsets.only(top: 40, bottom: 20),
        // ),
      ),
    );
  }
}
