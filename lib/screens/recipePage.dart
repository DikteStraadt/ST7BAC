import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Opskrifter"),
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