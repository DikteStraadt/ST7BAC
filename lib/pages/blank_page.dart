import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Funktionalitet ikke implementeret"),
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