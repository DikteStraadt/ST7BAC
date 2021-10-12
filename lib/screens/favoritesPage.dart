import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {

  const FavoritesPage({Key? key})
      : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Set<String> _savedRecipies;

  @override
  void initState() {
    _savedRecipies = <String>{"mexicansk-risret","one-pot-pasta"};
    super.initState();
  }

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
        title: const Text('Favoritter'),
        leading: Icon(
          Icons.home_outlined,
          size: 28,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[for (var i in _savedRecipies) _buildCard(i)],
        ),
      ),
    );
  }
}
