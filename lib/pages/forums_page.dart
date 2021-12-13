import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/pages/forum_details_page.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

// Sources
// Forum layout inspiration from https://flutterappworld.com/flutter-forum-application/ and https://github.com/ArunBalajiR/Flutter-Chat-Application


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
        appBar: new AppBar(
          title: const Text('Forum'),
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
                    Snackbar snackbar = new Snackbar();
                    snackbar.notImplementedSnackBar(context);
                  },
                  child: Icon(
                    Icons.search,
                    size: 28,
                  ),
                )),
          ],
        ),
        body: new Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.015,
            ),
            Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: threads,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'newforum');
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  var threads = new Container(
    padding: const EdgeInsets.all(8.0),
    child: StreamBuilder(
      stream: FirebaseDatabase.instance.reference().child('Forum').onValue,
      builder: (context, snapshot) {
        final tilesList = <Container>[];
        if (snapshot.hasData) {
          final myForums = Map<String, dynamic>.from(
              (snapshot.data! as Event).snapshot.value);
          myForums.forEach(
            (key, value) {
              final nextForum = Map<String, dynamic>.from(value);
              final forumTile = _buildListView(nextForum, context);
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
  );
}

Container _buildListView(Map<String, dynamic> entry, BuildContext context) {
  return new Container(
    padding: const EdgeInsets.all(3.0),
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
    decoration: new BoxDecoration(
      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      color: Colors.white,
    ),
    child: new ListTile(
      title: new Text(entry['title']),
      subtitle: new Text(entry['question']),
      leading: new Icon(
        Icons.forum_rounded,
        size: MediaQuery.of(context).size.width * 0.08,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ForumDetailPage(forum: entry)));
      },
    ),
  );
}
