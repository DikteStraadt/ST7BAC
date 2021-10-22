import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/database/repository.dart';
import 'package:flutter_project_1_0/navigation/page_view.dart';
import 'blank_page.dart';
import 'package:flutter_project_1_0/pages/login_page.dart';
//import 'package:flutter_project_1_0/models/user.dart' as user;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSigningOut = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
    super.initState();
  }

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
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.black.withAlpha(0),
              Colors.black12,
              Colors.black45
            ],
          ),
          // image: DecorationImage(
          //     image: AssetImage("lib/assets/background.jpg"), fit: BoxFit.cover),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, bottom: 10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  'Hånd i hånd',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("lib/assets/zebra.png"),
              //         fit: BoxFit.cover),
              //   ),
              // ),
              Expanded(
                child: GridView(
                  controller: _scrollController,
                  //physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: menuButtons.map((title) {
                    return GestureDetector(
                      child: Card(
                          margin: const EdgeInsets.all(15.0),
                          child: getCardByTitle(title)),
                      onTap: () {
                        //Repository.getCurrentUser().then(setCurrentUser);

                        if (title == "Opskrifter")
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageViewController()));
                        //builder: (context) => Navigationbar()));
                        else
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlankPage()));
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () async {
                    // setState(() {
                    //   _isSigningOut = true;
                    // });
                    // await FirebaseAuth.instance.signOut();
                    // setState(() {
                    //   _isSigningOut = false;
                    // });
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginPage(),
                    //   ),
                    // );
                    // Repository.setCurrentUser("");
                  },
                  child: Text(
                    'Log ud',
                    style: TextStyle(color: Colors.white, fontSize: 25),
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
              )
            ],
          )),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  // void setCurrentUser(user.User value) {
  //   setState(() {
  //     _currentUser = value.id;
  //   });
  // }
}
