import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/favorite.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/pages/home_page.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';

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
    //Repository.favoritesNotNull(_currentUser!.uid.toString()).then(isListEmpty);
    Repository.getFavorites(_currentUser!.uid.toString()).then(updateFavorites);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritter'),
        backgroundColor: Colors.teal[600],
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
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.teal[100]),
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
                ),
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
                child: IconButton(
                  icon: new Icon(
                    alreadySaved ? Icons.favorite : Icons.favorite_border,
                    size: 80,
                    color: Colors.red[900],
                  ),
                  onPressed: () {
                    setState(
                      () {
                        if (alreadySaved) {
                          setState(
                            () {
                              Repository.removeFavorite(
                                  favorite); // Remove recipe as favorite in database
                              Repository.getFavorites(
                                      _currentUser!.uid.toString())
                                  .then(updateFavorites);
                            },
                          );
                        } else {
                          setState(() {
                            Repository.setFavorite(
                                favorite); // Set recipe as favorite in database
                            Repository.getFavorites(
                                    _currentUser!.uid.toString())
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
      Repository.getFavorites(_currentUser!.uid.toString())
          .then(updateFavorites);
    }
  }
}
