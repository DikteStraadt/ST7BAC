import 'package:flutter/material.dart';

class MySnackbar{

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> notImplementedSnackBar(BuildContext c){
    final snackBar = SnackBar(behavior: SnackBarBehavior.floating, content: Text('Funktionaliteten er endnu ikke implementeret'), backgroundColor: Colors.yellow[700], duration: Duration(seconds: 1));

    return ScaffoldMessenger.of(c).showSnackBar(snackBar);
  }

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> addToPlanSnackBar(BuildContext c){
    final snackBar = SnackBar(behavior: SnackBarBehavior.floating, content: Text('Opskriften er tilføjet til madplanen'), backgroundColor: Colors.deepOrangeAccent, duration: Duration(seconds: 3));

    return ScaffoldMessenger.of(c).showSnackBar(snackBar);
  }



}