import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/favoritesPage.dart';

class RecipePage extends StatefulWidget {
  final User user;
  const RecipePage({Key? key, required this.user}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opskrifter'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
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
        builder: (context) => FavoritesPage(savedRecipies: _savedRecipies),
      ),
    );
  }
}
