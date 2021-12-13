import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/databaseService.dart';
import 'package:flutter_project_1_0/models/favorite.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';
import 'package:flutter_project_1_0/pages/select_plan_page.dart';

// Souces:
// Inspiration to adding element to favorite: https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#4

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<Favorite> _favoriteRecipies = [];
  User? _currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    DatabaseService.getFavorites(_currentUser!.uid.toString()).then(updateFavorites);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritter'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'home');
          },
          child: Icon(
            Icons.home_outlined,
            size: 28,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (var i in _favoriteRecipies) _buildCard(i),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Favorite favorite) {
    bool alreadySaved = _favoriteRecipies.contains(favorite);

    if (_favoriteRecipies.isNotEmpty) {
      return Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipePage(
                    recipe: new Recipe(
                        favorite.id,
                        favorite.name,
                        favorite.picture,
                        favorite.prepTime,
                        favorite.totalTime,
                        favorite.servings,
                        favorite.numberOfingredients,
                        favorite.ingredientList,
                        favorite.method),
                    route: "f"),
              ),
            );
          },
          child: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(color: Colors.white),
                alignment: Alignment.center,
                child: Image.asset(favorite.picture, fit: BoxFit.fill),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: new Icon(
                          alreadySaved ? Icons.favorite : Icons.favorite_border,
                          size: MediaQuery.of(context).size.width * 0.15,
                          color: Colors.red[900],
                        ),
                        onTap: () {
                          setState(
                            () {
                              if (alreadySaved) {
                                setState(
                                  () {
                                    DatabaseService.removeFavorite(
                                        favorite); // Remove recipe as favorite in database
                                    DatabaseService.getFavorites(
                                            _currentUser!.uid.toString())
                                        .then(updateFavorites);
                                  },
                                );
                              } else {
                                setState(
                                  () {
                                    DatabaseService.setFavorite(
                                        favorite); // Set recipe as favorite in database
                                    DatabaseService.getFavorites(
                                            _currentUser!.uid.toString())
                                        .then(updateFavorites);
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.55),
                    PopupMenuButton(
                      icon: new Icon(Icons.more_horiz),
                      iconSize: MediaQuery.of(context).size.width * 0.15,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.edit_rounded,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03),
                              Text("Tilføj opskrift til madplan"),
                            ],
                          ),
                          onTap: () async {
                            await Future.delayed(Duration.zero);
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    SelectPlanPage(
                                        recipe: new Recipe(
                                            favorite.id,
                                            favorite.name,
                                            favorite.picture,
                                            favorite.prepTime,
                                            favorite.totalTime,
                                            favorite.servings,
                                            favorite.numberOfingredients,
                                            favorite.ingredientList,
                                            favorite.method),
                                        route: "ff"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return new Card();
    }
  }

  updateFavorites(Map<dynamic, dynamic> favorites) {
    List<Favorite> favoriteList = [];
    int j = 0;

    setState(
      () {
        favorites.forEach(
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

        _favoriteRecipies = favoriteList;
      },
    );
  }

  isListEmpty(bool exists) {
    if (exists == true) {
      DatabaseService.getFavorites(_currentUser!.uid.toString())
          .then(updateFavorites);
    }
  }
}
