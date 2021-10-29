import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/models/list_entry.dart';
import 'package:flutter_project_1_0/pages/forum_details_page.dart';
import 'package:flutter_project_1_0/pages/home_page.dart';
import 'package:flutter_project_1_0/pages/new_forum_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => new _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  static final listItemsData = [
    // new ListEntry("Forum 1", "test", new User(), 54, 2, []),
    // new ListEntry("Forum 2", "test", 154, 3, []),
    // new ListEntry("Forum 3", "test", 971, 0, []),
  ];

  // ###############################################################################################

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: const Text('Forum'),
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
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  mySnackbar snackbar = new mySnackbar();
                  snackbar.notImplementedSnackBar(context);
                },
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              )),
        ],
      ),
      body: new Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: new Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.width * 0.015),
              // StreamBuilder(
              //   stream: FirebaseDatabase.instance
              //       .reference()
              //       .child("Forum")
              //       .orderByKey()
              //       .onValue,
              //   builder: (context, snapshot) {
              //     final tilesList = <ListTile>[];
              //     if (snapshot.hasData) {
              //       final myForums = Map<String, dynamic>.from(
              //           (snapshot.data! as Event).snapshot.value);
              //       myForums.forEach(
              //         (key, value) {
              //           final nextForum = Map<String, dynamic>.from(value);
              //           final forumTile = ListTile(
              //               leading: new Icon(Icons.add),
              //               title: Text(nextForum['title']),
              //               subtitle: Text(nextForum['createdBy']));
              //           tilesList.add(forumTile);
              //         },
              //       );
              //     }

              //     return ListView(children: tilesList);
              //   },
              // )
              // for (var entry in listItemsData) _buildListView(entry, context), ////////////////////////////////
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewForumPage()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal[600],
      ),
    );
  }
}

Widget _buildListView(ListEntry entry, BuildContext context) {
  return new Container(
    padding: const EdgeInsets.all(3.0),
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
    decoration: new BoxDecoration(
      borderRadius: new BorderRadius.all(new Radius.circular(1.0)),
      color: Colors.teal[100],
    ),
    child: new ListTile(
      title: new Text(entry.title),
      leading: new Icon(
        Icons.forum_rounded,
        size: MediaQuery.of(context).size.width * 0.08,
      ),
      // trailing: Container(
      //   child: new Column(
      //     children: <Widget>[
      //       new IconButton(
      //         icon: new Icon(Icons.comment),
      //         onPressed: () {},
      //       ),
      //       new Text(entry.responses.toString(), style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.02),)
      //     ],
      //   ),
      // ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ForumDetailPage()));
      },
    ),
  );
}
