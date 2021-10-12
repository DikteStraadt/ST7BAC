import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Repository {
  final mDatabase = FirebaseDatabase.instance.reference();

  static Future<void> setCurrentUser(String userId) async {
    return FirebaseDatabase.instance
        .reference()
        .child("CurrentUserId")
        .set(userId);
  }

  static Future<String> getCurrentUser() async {

    // FirebaseDatabase.instance.reference().child("CurrentUserId").once().then((DataSnapshot data){
    //               print("value: " + data.value);
    //               print("key:" + data.key.toString());
    // });

    return "";
  }

  

  // static Future<StreamSubscription<Event>> getCurrentUser() async {
  //   StreamSubscription<Event> userId = FirebaseDatabase.instance
  //       .reference()
  //       .child("CurrentUserId")
  //       .onValue
  //       .listen((Event event) {
  //     String id = event.snapshot.value as String;
  //     print(id);
  //     // if (id == null) {
  //     //   id = "";
  //     // }
  //   });

  //   print(userId);
  //   return userId;
  // }
}
