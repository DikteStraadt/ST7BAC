import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_project_1_0/models/user.dart';

class Repository {
  static final FirebaseDatabase firebaseDatabase = new FirebaseDatabase();

  static Future<void> setCurrentUser(String userId) async {
    return FirebaseDatabase.instance
        .reference()
        .child("CurrentUserId")
        .set(userId);
  }

  static Future<StreamSubscription<Event>> getCurrentUserStream(
      void onData(User user)) async {
    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("CurrentUserId")
        .onValue
        .listen((Event event) {
      var user = new User.fromJson(event.snapshot.key, event.snapshot.value);
      onData(user);
    });

    return subscription;
  }

  static Future<User> getCurrentUser() async {
    Completer<User> completer = new Completer<User>();

    FirebaseDatabase.instance
        .reference()
        .child("CurrentUserId")
        .once()
        .then((DataSnapshot snapshot) {
      var user = new User.fromJson(snapshot.key, snapshot.value);
      completer.complete(user);
    });

    return completer.future;
  }
}
