import 'package:flutter/material.dart';

class NewPlanPage extends StatelessWidget {
  NewPlanPage({Key? key}) : super(key: key);
  
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opret ny maplan"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Giv din nye maplan et navn"),
            TextField(
              controller: _textController,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              child: Text('Opret madplan'),
            ),
          ],
        ),
      ),
    );
  }
}
