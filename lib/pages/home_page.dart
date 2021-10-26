import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/utilities/navigation/page_view.dart';
import 'package:flutter_project_1_0/pages/login_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_project_1_0/models/user.dart' as user;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSigningOut = false;
  ScrollController _scrollController = new ScrollController();

  final List<String> menuButtons = [
    "Opskrifter",
    "Aktiviteter",
    "Medier",
    "Forum",
    "Vejledning",
    "Events"
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) =>
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent));

    return Scaffold(
      body: Container(
        child: Container(
          margin: const EdgeInsets.only(top: 40, bottom: 20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  'Hånd i hånd',
                  style: TextStyle(fontFamily: 'Margarine', fontSize: 50),
                ),
              ),
              Expanded(
                child: GridView(
                  controller: _scrollController,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: menuButtons.map((title) {
                    return GestureDetector(
                      child: Card(
                          margin: const EdgeInsets.all(15.0),
                          child: getCardByTitle(title)),
                      onTap: () {
                        if (title == "Opskrifter")
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageViewController()));
                        //builder: (context) => Navigationbar()));
                        else {
                          mySnackbar snackbar = new mySnackbar();
                          snackbar.notImplementedSnackBar(context);
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await FirebaseAuth.instance.signOut();
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Log ud',
                    style: TextStyle(fontFamily: 'Margarine', fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column getCardByTitle(String title) {
    String img = "";
    if (title == "Opskrifter")
      img = "lib/assets/home/opskrifter.JPG";
    else if (title == "Aktiviteter")
      img = "lib/assets/home/aktiviteter.JPG";
    else if (title == "Medier")
      img = "lib/assets/home/medier.JPG";
    else if (title == "Forum")
      img = "lib/assets/home/forum.JPG";
    else if (title == "Vejledning")
      img = "lib/assets/home/vejledning.JPG";
    else
      img = "lib/assets/home/events.JPG";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
            child: new Stack(
              children: <Widget>[
                new Image.asset(
                  img,
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.35,
                ),
              ],
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
              fontFamily: 'Margarine'),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // void setCurrentUser(user.User value) {
  //   setState(() {
  //     _currentUser = value.id;
  //   });
  // }
}
