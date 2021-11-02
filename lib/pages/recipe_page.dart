import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/pages/select_plan_page.dart';
import 'package:flutter_project_1_0/utilities/navigation/page_view.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
  const RecipePage({Key? key, required this.recipe, required this.route})
      : super(key: key);

  final Recipe recipe;
  final String route;
}

class _RecipePageState extends State<RecipePage> {
  User? _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        backgroundColor: Colors.teal[600],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (widget.route == "r") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageViewController(initpage: 0),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageViewController(initpage: 2),
                ),
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              FittedBox(
                child: Container(
                  color: Colors.teal[400],
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.recipe.name,
                          style: TextStyle(
                              fontFamily: 'Margarine',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.015),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Image.asset(widget.recipe.picture),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.025),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  "Tid i alt: " + widget.recipe.totalTime,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Margarine',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035),
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: Text(
                                  "Antal: " +
                                      widget.recipe.servings.toString() +
                                      " pers.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Margarine',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035),
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: Text(
                                  "Arbejdstid: " + widget.recipe.prepTime,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Margarine',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035),
                                  textAlign: TextAlign.center),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.015)
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.025),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.025),
              FittedBox(
                child: Container(
                  color: Colors.teal[400],
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.025),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Ingredienser",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Margarine',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Fremgangsmåde",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Margarine',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.025),
                                  Text(
                                    printIngrdients(
                                        widget.recipe.ingredientList),
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.025),
                                  Text(
                                    widget.recipe.method,
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            SelectPlanPage(recipe: widget.recipe, route: widget.route),
                      ),
                    );
                  },
                  child: Text(
                    'Tilføj til madplan',
                    style: TextStyle(
                        fontFamily: 'Margarine',
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[600],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    MySnackbar snackbar = new MySnackbar();
                    snackbar.notImplementedSnackBar(context);
                  },
                  child: Text(
                    'Udskriv indkøbsliste',
                    style: TextStyle(
                        fontFamily: 'Margarine',
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[600],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    MySnackbar snackbar = new MySnackbar();
                    snackbar.notImplementedSnackBar(context);
                  },
                  child: Text(
                    'Tilføj til favoritter',
                    style: TextStyle(
                        fontFamily: 'Margarine',
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[600],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  String printIngrdients(List<Ingredient> ingredients) {
    String string = "";

    for (Ingredient i in ingredients) {
      List<String> amountArr = i.amount.toString().split('.');
      string += amountArr[0].toString() +
          " " +
          i.unit.toString() +
          " " +
          i.name.toString() +
          "\n\n";
    }

    return string;
  }
}
