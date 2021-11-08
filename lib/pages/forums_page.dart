import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/pages/forum_details_page.dart';
import 'package:flutter_project_1_0/pages/home_page.dart';
import 'package:flutter_project_1_0/pages/new_forum_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

class ForumsPage extends StatefulWidget {
  @override
  _ForumsPageState createState() => new _ForumsPageState();
}

class _ForumsPageState extends State<ForumsPage> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, 'home');
        return false;
      },
      child: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: const Text('Forum'),
          backgroundColor: Colors.teal[600],
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'home');
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
                    MySnackbar snackbar = new MySnackbar();
                    snackbar.notImplementedSnackBar(context);
                  },
                  child: Icon(
                    Icons.search,
                    size: 28,
                  ),
                )),
          ],
        ),
        // body: ElevatedButton(
        //     onPressed: () {
        //       Repository.setForum(new ListEntry(Uuid().v4(), "HJælp", "nronfoe", FirebaseAuth.instance.currentUser!.displayName, 2, 2, []));
        //     },
        //     child: Text('Push')),
        body: new Container(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.015,
                  ),
                  StreamBuilder(
                    stream: FirebaseDatabase.instance
                        .reference()
                        .child('Forum')
                        .onValue,
                    builder: (context, snapshot) {
                      final tilesList = <Container>[];
                      if (snapshot.hasData) {
                        final myForums = Map<String, dynamic>.from(
                            (snapshot.data! as Event).snapshot.value);
                        myForums.forEach(
                          (key, value) {
                            final nextForum = Map<String, dynamic>.from(value);
                            final forumTile =
                                _buildListView(nextForum, context);
                            tilesList.add(forumTile);
                          },
                        );
                        return ListView(
                          children: tilesList,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        );
                      } else {
                        return SizedBox(
                          height: 0,
                        );
                      }
                    },
                  ),
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'newforum');
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.teal[600],
        ),
      ),
    );
  }
}

Container _buildListView(Map<String, dynamic> entry, BuildContext context) {
  return new Container(
    padding: const EdgeInsets.all(3.0),
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
    decoration: new BoxDecoration(
      borderRadius: new BorderRadius.all(new Radius.circular(1.0)),
      color: Colors.teal[100],
    ),
    child: new ListTile(
      title: new Text(entry['title']),
      subtitle: new Text(entry['question']),
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
      //       new Text(entry['responses'].toString(), style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.01),),
      //     ],
      //   ),
      // ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ForumDetailPage(forum: entry)));
      },
    ),
  );
}
