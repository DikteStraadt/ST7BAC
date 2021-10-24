import 'package:flutter/material.dart';

class mySnackbar{

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(BuildContext c){
    final snackBar = SnackBar(behavior: SnackBarBehavior.floating, content: Text('Funktionaliteten er endnu ikke implementeret'), backgroundColor: Colors.deepOrangeAccent, duration: Duration(seconds: 1));

    return ScaffoldMessenger.of(c).showSnackBar(snackBar);
  }



}