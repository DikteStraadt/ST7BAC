import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/navigation/navigationbar.dart';
import '../screens/blankPage.dart';
import 'package:flutter_project_1_0/screens/loginPage.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User _currentUser;
  bool _isSigningOut = false;

  @override
  void initState() {
    _currentUser = widget.user;
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
          margin: const EdgeInsets.only(top: 50.0, bottom: 20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Lidt-en-Valdemarsro-app',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/zebra.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: GridView(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: menuButtons.map((title) {
                    return GestureDetector(
                      child: Card(
                          margin: const EdgeInsets.all(20.0),
                          child: getCardByTitle(title)),
                      onTap: () {
                        if (title == "Opskrifter")
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Navigationbar(user: _currentUser)));
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
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Container(child: Text(_currentUser.displayName.toString()),)
            ],
          ),
        ),
      ),
    );
  }

  Column getCardByTitle(String title) {
    String img = "";
    if (title == "Opskrifter")
      img = "lib/assets/aesel.png";
    else if (title == "Aktiviteter")
      img = "lib/assets/gepard.png";
    else if (title == "Medier")
      img = "lib/assets/baever.png";
    else if (title == "Forum")
      img = "lib/assets/koala.png";
    else if (title == "Vejledning")
      img = "lib/assets/struds.png";
    else
      img = "lib/assets/giraf.png";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
              child: new Stack(
            children: <Widget>[
              new Image.asset(
                img,
                width: 80.0,
                height: 80.0,
              )
            ],
          )),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
