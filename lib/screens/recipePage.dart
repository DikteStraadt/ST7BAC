import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/homePage.dart';

class RecipePage extends StatelessWidget {
    final User user;
    const RecipePage({required this.user});

  @override
  Widget build(BuildContext context) {
    // late User _currentUser;  
    // bool _isSigningOut = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Opskrifter"),
        leading: GestureDetector(
          onTap: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(user: user)));},
          child: Icon(
            Icons.home_outlined,
            size: 30,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {/* Write listener code here */},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
      ),
    );
  }
}
