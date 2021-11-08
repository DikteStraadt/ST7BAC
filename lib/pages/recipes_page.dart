import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/favorite.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/pages/home_page.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  //Recipes _r = new Recipes();     //For loading recipes from recipes class.
  late List<Recipe> _recipies = [];
  late List<Favorite> _favoriteRecipies = [];
  User? _currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    //_recipies = _r.loadRecipes();     // Loading recipes from recipes class. Shall only be used the first time, to write data to database
    Repository.getRecipes()
        .then(updateRecipes); // Loading recipes from database
    Repository.getFavorites(_currentUser!.uid.toString()).then(updateFavorites);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opskrifter'),
        backgroundColor: Colors.teal[600],
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
                  MySnackbar snackbar = new MySnackbar();
                  snackbar.notImplementedSnackBar(context);
                },
                child: Icon(
                  Icons.filter_alt_outlined,
                  size: 28,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  MySnackbar snackbar = new MySnackbar();
                  snackbar.notImplementedSnackBar(context);
                },
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.teal[100]),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: <Widget>[
            for (var recipe in _recipies) _buildCard(recipe),
          ]),
        ),
      ),
    );
  }

  Widget _buildCard(Recipe recipe) {
    bool alreadySaved = contains(recipe.id);
    //Repository.setRecipe(recipe);    // Writing new recipes to database

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipePage(recipe: recipe, route: "r"),
            ),
          );
        },
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
                          _currentUser!.uid.toString(),
                          recipe.id,
                          recipe.name,
                          recipe.picture,
                          recipe.prepTime,
                          recipe.totalTime,
                          recipe.servings,
                          recipe.numberOfingredients,
                          recipe.ingredientList,
                          recipe.method);
                      if (alreadySaved) {
                        setState(
                          () {
                            Repository.removeFavorite(
                                favorite); // Remove recipe as favorite in database
                            Repository.getFavorites(_currentUser!.uid.toString())
                                .then(updateFavorites);
                          },
                        );
                        _favoriteRecipies.remove(favorite);
                      } else {
                        setState(() {
                          Repository.setFavorite(
                              favorite); // Set recipe as favorite in database
                          Repository.getFavorites(_currentUser!.uid.toString())
                              .then(updateFavorites);
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateRecipes(Map<dynamic, dynamic> recipes) {
    List<Recipe> recipeList = [];
    int j = 0;

    setState(
      () {
        recipes.forEach(
          (key, value) {
            List<Ingredient> ingredientList = [];
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
              new Recipe(
                  key,
                  value["name"],
                  value["picture"],
                  value["prepTime"],
                  value["totalTime"],
                  value["servings"],
                  value["numberOfingredients"],
                  ingredientList,
                  value["method"]),
            );
          },
        );

        _recipies = recipeList;
      },
    );
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
          new Favorite(
              _currentUser!.uid.toString(),
              key,
              value["name"],
              value["picture"],
              value["prepTime"],
              value["totalTime"],
              value["servings"],
              value["numberOfingredients"],
              ingredientList,
              value["method"]),
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