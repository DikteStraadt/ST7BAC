import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Repository {
  //final mDatabase = FirebaseDatabase.instance.reference();
  static final FirebaseDatabase firebaseDatabase = new FirebaseDatabase();

  static Future<void> setCurrentUser(String userId) async {
    return FirebaseDatabase.instance
        .reference()
        .child("CurrentUserId")
        .set(userId);
  }

  // static Future<String> getCurrentUserFuture() async {
//     final String result =
//         (await firebaseDatabase.reference().child("CurrentUserId").once())
//             .value
//             .toString();
//     print("result: $result");
//     return result;
//   }

//   static Future<String> getCurrentUser() async {
//     String news = await getCurrentUserFuture();
//     print("Something: " + news);
//     return news;
// }
}

