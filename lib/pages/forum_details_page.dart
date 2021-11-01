import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/models/form_post_entry.dart';
import 'package:flutter_project_1_0/pages/new_post_page.dart';
import 'package:flutter_project_1_0/utilities/datetime_converter.dart';
import 'package:flutter_project_1_0/utilities/snack_bar.dart';

class ForumDetailPage extends StatefulWidget {
  @override
  _ForumDetailPageState createState() => new _ForumDetailPageState();
  const ForumDetailPage({Key? key, required this.forum}) : super(key: key);

  final Map<String, dynamic> forum;
}

class _ForumDetailPageState extends State<ForumDetailPage> {
  DateTimeConverter _converter = new DateTimeConverter();

  @override
  Widget build(BuildContext context) {
    var questionSection = new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(5.0),
            decoration: new BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
            ),
            child: new Column(
              children: <Widget>[
                Text(
                  widget.forum['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Margarine',
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.blueGrey[500],
                    borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                    ),
                  ),
                  child: new Row(
                    children: <Widget>[
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      new Icon(
                        Icons.person,
                        size: 50.0,
                      ),
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(widget.forum['user']),
                            new Text(_converter
                                .convertDateTimeToString(widget.forum['date'])
                                .toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width * 1,
                  margin:
                      const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: new BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: const Radius.circular(20.0),
                          bottomRight: const Radius.circular(20.0))),
                  child: new Text(widget.forum['question']),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    var responses = new Container(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: FirebaseDatabase.instance.reference().child('Posts').orderByChild('listEntryId').equalTo(widget.forum['id']).onValue,
        builder: (context, snapshot) {
          final tilesList = <Container>[];
          if (snapshot.hasData) {
            print(widget.forum['id']);
            final posts = Map<String, dynamic>.from(
                (snapshot.data! as Event).snapshot.value);
            posts.forEach(
              (key, value) {
                final nextPost = Map<String, dynamic>.from(value);
                final postTile = _buildListView(nextPost, context);
                tilesList.add(postTile);
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
      // child:
      // new ListView.builder(
      // itemBuilder: (BuildContext context, int index) =>
      //     new ForumPost(ForumPostArr[index]),
      // itemCount: ForumPostArr.length,
      // ));
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Forum"),
        backgroundColor: Colors.teal[600],
      ),
      body: new Column(
        children: <Widget>[
          questionSection,
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: responses,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewPostPage(id: widget.forum['id'])));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal[600],
      ),
    );
  }
}

Container _buildListView(Map<String, dynamic> entry, BuildContext context) {
  DateTimeConverter _converter = new DateTimeConverter();
  mySnackbar snackbar = new mySnackbar();

  return new Container(
    margin: const EdgeInsets.all(5.0),
    decoration: new BoxDecoration(
      borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
    ),
    child: new Column(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            color: Colors.teal[300],
            borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0)),
          ),
          child: new Row(
            children: <Widget>[
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              new Icon(
                Icons.person,
                size: 50.0,
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(entry['username'].toString()),
                    new Text(_converter
                        .convertDateTimeToString(entry['hours'])
                        .toString()),
                  ],
                ),
              ),
              new Row(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      snackbar.notImplementedSnackBar(context);
                    },
                    child: new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_up),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: new Text(entry['likes'].toString()),
                  ),
                  new GestureDetector(
                    onTap: () {
                      snackbar.notImplementedSnackBar(context);
                    },
                    child: new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_down),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                    child: new Text(entry['dislikes'].toString()),
                  ),
                ],
              )
            ],
          ),
        ),
        new Container(
          width: MediaQuery.of(context).size.width * 1,
          margin: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
          padding: const EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                  bottomLeft: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0))),
          child: new Text(entry['text']),
        ),
      ],
    ),
  );
}

// ********************************************************************************************

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry);

  @override
  Widget build(BuildContext context) {
    DateTimeConverter _converter = new DateTimeConverter();

    return new Container(
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.teal[300],
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
            ),
            child: new Row(
              children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                new Icon(
                  Icons.person,
                  size: 50.0,
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(entry.username.toString()),
                      new Text(_converter
                          .convertDateTimeToString(entry.date)
                          .toString()),
                    ],
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_up),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Text(entry.likes.toString()),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_down),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                      child: new Text(entry.dislikes.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0))),
            child: new Text(entry.text),
          ),
        ],
      ),
    );
  }
}

// class IconWithText extends StatelessWidget {
//   final IconData iconData;
//   final String text;
//   final Color iconColor;

//   IconWithText(this.iconData, this.text, {required this.iconColor});
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       child: new Row(
//         children: <Widget>[
//           new Icon(
//             this.iconData,
//             color: this.iconColor,
//           ),
//           new Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: new Text(this.text),
//           ),
//         ],
//       ),
//     );
//   }
// }
