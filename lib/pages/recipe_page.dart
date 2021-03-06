import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/pages/select_plan_page.dart';
import 'package:flutter_project_1_0/utilities/navigation.dart';
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

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        goBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.recipe.name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              goBack();
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
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xfff001c7c), width: 3),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.width * 0.07),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Image.asset(widget.recipe.picture),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.width * 0.025),
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
                              height:
                                  MediaQuery.of(context).size.width * 0.025),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.025),
                FittedBox(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xfff001c7c), width: 3),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.width * 0.025),
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
                                    Text("Fremgangsm??de",
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
                                  width: MediaQuery.of(context).size.width *
                                      0.025),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.025),
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
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                      textAlign: TextAlign.start,
                                    ),
                                                                        SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.04)
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.04)
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
                          builder: (BuildContext context) => SelectPlanPage(
                              recipe: widget.recipe, route: widget.route),
                        ),
                      );
                    },
                    child: Text('Tilf??j til madplan',
                        style: TextStyle(
                            color: Color(0xfff001c7c),
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Margarine')),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        width: 2.0,
                        color: Color(0xfff001c7c),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Snackbar snackbar = new Snackbar();
                      snackbar.notImplementedSnackBar(context);
                    },
                    child: Text('Udskriv indk??bsliste',
                        style: TextStyle(
                            color: Color(0xfff001c7c),
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Margarine')),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        width: 2.0,
                        color: Color(0xfff001c7c),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Snackbar snackbar = new Snackbar();
                      snackbar.notImplementedSnackBar(context);
                    },
                    child: Text('Tilf??j til favoritter',
                        style: TextStyle(
                            color: Color(0xfff001c7c),
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: 'Margarine')),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        width: 2.0,
                        color: Color(0xfff001c7c),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goBack() {
    if (widget.route == "r") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationController(initpage: 0),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationController(initpage: 2),
        ),
      );
    }
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
