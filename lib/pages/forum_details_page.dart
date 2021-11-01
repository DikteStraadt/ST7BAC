import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/models/form_post_entry.dart';
import 'package:flutter_project_1_0/pages/new_post_page.dart';

class ForumDetailPage extends StatefulWidget {
  @override
  _ForumDetailPageState createState() => new _ForumDetailPageState();
  const ForumDetailPage({Key? key, required this.forum}) : super(key: key);

  final Map<String, dynamic> forum;
}

var ForumPostArr = [
  new ForumPostEntry("", "User1", DateTime.now().toString(), 0, 0,
      "Hello,\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
];

class _ForumDetailPageState extends State<ForumDetailPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var questionSection = new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Text(
            widget.forum['title'],
            textScaleFactor: 1.5,
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // children: <Widget>[
              //   new IconWithText(Icons.laptop_mac, "Technology"),
              //   new IconWithText(
              //     Icons.check_circle,
              //     "Answered",
              //     iconColor: Colors.green,
              //   ),
              //   new IconWithText(Icons.remove_red_eye, "54")
              // ],
            ),
          ),
          new Divider()
        ],
      ),
    );

    var responses = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              new ForumPost(ForumPostArr[index]),
          itemCount: ForumPostArr.length,
        ));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Forum"),
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
              context, MaterialPageRoute(builder: (context) => NewPostPage(id: widget.forum['id'])));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal[600],
      ),
    );
  }
}

// ********************************************************************************************

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
            ),
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.person,
                  size: 50.0,
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //new Text(entry.username),
                      //new Text(entry.hours),
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