import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/models/favorite.dart';
import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/user.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<Favorite> _favoriteRecipies = [];
  String _currentUser = "9xNt9mjHGjMPeWx54dutlamCzRC2";

  @override
  void initState() {
    Repository.getCurrentUser()
        .then(setCurrentUser); // Get current user from database
    Repository.getFavorites(_currentUser).then(updateFavorites);
    super.initState();
  }

  Widget _buildCard(Favorite favorite) {
    bool alreadySaved = _favoriteRecipies.contains(favorite);

    if (_favoriteRecipies.isNotEmpty) {
      return Card(
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
                            print("REMOVE!");
                            Repository.removeavorite(
                                favorite); // Remove recipe as favorite in database
                            Repository.getFavorites(_currentUser)
                                .then(updateFavorites);
                          },
                        );
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
    } else {
      return new Card();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritter'),
        leading: Icon(
          Icons.home_outlined,
          size: 28,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (_favoriteRecipies.isNotEmpty)
              for (var i in _favoriteRecipies) _buildCard(i),
          ],
        ),
      ),
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

    setState(
      () {
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

        print("FAVORITE!");
        _favoriteRecipies = favoriteList;
      },
    );
  }
}
