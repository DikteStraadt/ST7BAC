import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/utilities/navigation.dart';
import 'package:flutter_project_1_0/pages/login_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

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
    return new WillPopScope(
      onWillPop: () async {
        logout();
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffff8f3e9),
              Color(0xfffefe1c8),
            ],
          )),
          child: Container(
            margin: const EdgeInsets.only(top: 40, bottom: 20),
            child: Column(
              children: <Widget>[
                Text(
                    'Hånd i hånd',
                    style: TextStyle(
                        fontFamily: 'Margarine',
                        fontSize: MediaQuery.of(context).size.width * 0.12),
                  ),
                Expanded(
                  child: GridView(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
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
                                    builder: (context) =>
                                        NavigationController(initpage: 0)));
                          else if (title == "Forum") {
                            Navigator.pushNamed(context, 'forums');
                          } else if (title == "Aktiviteter") {
                            Navigator.pushNamed(context, 'activities');
                          } else {
                            MySnackbar snackbar = new MySnackbar();
                            snackbar.notImplementedSnackBar(context);
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      logout();
                    },
                    child: Text('Log ud',
                        style: TextStyle(
                            color: Color(0xfff001c7c),
                            fontSize: 25,
                            fontFamily: 'Margarine')),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        width: 2.0,
                        color: Color(0xfff001c7c),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
      img = "lib/assets/home/notImplemented.JPG";
    else if (title == "Forum")
      img = "lib/assets/home/forum.JPG";
    else if (title == "Vejledning")
      img = "lib/assets/home/notImplemented.JPG";
    else
      img = "lib/assets/home/notImplemented.JPG";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
            child: new Stack(
              children: <Widget>[
                new Image.asset(
                  img,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
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
        SizedBox(height:  MediaQuery.of(context).size.width * 0.01)
      ],
    );
  }

  void logout() async {
    setState(() {
      _isSigningOut = true;
    });
    await FirebaseAuth.instance.signOut();
    setState(() {
      _isSigningOut = false;
    });
    Navigator.pushNamed(context, 'login');
  }

  // void setCurrentUser(user.User value) {
  //   setState(() {
  //     _currentUser = value.id;
  //   });
  // }
}
