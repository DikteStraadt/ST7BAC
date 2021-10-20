import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/favorite.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/models/user.dart';
import 'package:flutter_project_1_0/screens/homePage.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  //Recipes _r = new Recipes();     //For loading recipes from recipes class.
  late List<Recipe> _recipies = [];
  late List<Favorite> _favoriteRecipies = [];
  String _currentUser = "9xNt9mjHGjMPeWx54dutlamCzRC2";

  @override
  void initState() {
    //_recipies = _r.loadRecipes();     // Loading recipes from recipes class. Shall only be used the first time, to write data to database
    Repository.getCurrentUser()
        .then(setCurrentUser); // Get current user from database
    Repository.getRecipes()
        .then(updateRecipes); // Loading recipes from database
    Repository.getFavorites(_currentUser).then(updateFavorites);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opskrifter'),
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
                onTap: () {},
                child: Icon(
                  Icons.filter_alt_outlined,
                  size: 28,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          for (var recipe in _recipies) _buildCard(recipe),
        ]),
      ),
    );
  }

  Widget _buildCard(Recipe recipe) {
    bool alreadySaved = contains(recipe.id);
    //Repository.setRecipe(recipe);    // Writing new recipes to database

    return Card(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            child: Image.asset(recipe.picture, fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
              icon: new Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                size: 80,
                color: Colors.red[900],
              ),
              onPressed: () {
                setState(
                  () {
                    Favorite favorite = new Favorite(
                        _currentUser,
                        recipe.id,
                        recipe.name,
                        recipe.picture,
                        recipe.numberOfingredients,
                        recipe.ingredientList);
                    if (alreadySaved) {
                      setState(
                        () {
                          Repository.removeavorite(
                              favorite); // Remove recipe as favorite in database
                          Repository.getFavorites(_currentUser)
                              .then(updateFavorites);
                        },
                      );
                      _favoriteRecipies.remove(favorite);
                    } else {
                      setState(() {
                        Repository.setFavorite(
                            favorite); // Set recipe as favorite in database
                        Repository.getFavorites(_currentUser)
                            .then(updateFavorites);
                      });
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // void _pushSaved() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => FavoritesPage(),
  //     ),
  //   );
  // }

  updateRecipes(Map<dynamic, dynamic> recipes) {
    List<Recipe> recipeList = [];
    List<Ingredient> ingredientList = [];
    int j = 0;

    recipes.forEach(
      (key, value) {
        ingredientList.clear();
        j = value["numberOfingredients"];

        for (var i = 0; i < j; i++) {
          ingredientList.add(
            new Ingredient(
              value['ingredientList'][i]['name'].toString(),
              (value['ingredientList'][i]['amount']).toDouble(),
              value['ingredientList'][i]['unit'].toString(),
            ),
          );
        }

        recipeList.add(
          new Recipe(key, value["name"], value["picture"],
              value["numberOfingredients"], ingredientList),
        );
      },
    );

    setState(
      () {
        _recipies = recipeList;
      },
    );
  }

  void setCurrentUser(User value) {
    setState(() {
      _currentUser = value.id;
    });
  }

  updateFavorites(Map<dynamic, dynamic> favorites) {
    List<Favorite> favoriteList = [];
    List<Ingredient> ingredientList = [];
    int j = 0;

    favorites.forEach(
      (key, value) {
        ingredientList.clear();
        j = value["numberOfingredients"];

        for (var i = 0; i < j; i++) {
          ingredientList.add(
            new Ingredient(
              value['ingredientList'][i]['name'].toString(),
              (value['ingredientList'][i]['amount']).toDouble(),
              value['ingredientList'][i]['unit'].toString(),
            ),
          );
        }

        favoriteList.add(
          new Favorite(_currentUser, key, value["name"], value["picture"],
              value["numberOfingredients"], ingredientList),
        );
      },
    );

    setState(
      () {
        _favoriteRecipies = favoriteList;
      },
    );
  }

  bool contains(String recipeId) {
    for (var f in _favoriteRecipies) {
      if (f.id == recipeId) return true;
    }
    return false;
  }
}
