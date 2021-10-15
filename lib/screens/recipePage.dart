import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/navigation/navigationbar.dart';
import 'package:flutter_project_1_0/screens/favoritesPage.dart';
import 'package:flutter_project_1_0/screens/homePage.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final _repository = new Repository();
  final _savedRecipies = <String>{};

  Widget _buildCard(String recipeId) {
    final alreadySaved = _savedRecipies.contains(recipeId);
    String recipePictureAsset = "lib/assets/" + recipeId + ".jpg";

    return Card(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            child: Image.asset(recipePictureAsset, fit: BoxFit.fill),
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
                      _savedRecipies.remove(recipeId);
                    } else {
                      _savedRecipies.add(recipeId);
                      //_repository.addFavoriteRecipe(recipeId);
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

  @override
  Widget build(BuildContext context) {
    final String recipeId = "";
    final alreadySaved = _savedRecipies.contains(recipeId);
    PageController _controller = PageController(initialPage: 0);

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
        child: Column(
          children: <Widget>[
            _buildCard("mexicansk-risret"),
            _buildCard("one-pot-pasta"),
            _buildCard("vegetar-spaghetti"),
            _buildCard("crispy-kylling"),
            _buildCard("porretaerte"),
            _buildCard("graeskarsuppe"),
          ],
        ),
      ),
    );
  }

  void _pushSaved() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritesPage(),
      ),
    );
  }
}
