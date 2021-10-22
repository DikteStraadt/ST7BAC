import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Funktionalitet ikke implementeret"),
        backgroundColor: Colors.teal[600],
      ),
      
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Tilbage'),
        ),
      )
    );
  }
}