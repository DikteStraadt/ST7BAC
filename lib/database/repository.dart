import 'package:firebase_database/firebase_database.dart';

class Repository {

  final fb = FirebaseDatabase.instance;

  void setCurrentUser(String userId) {

    final ref = fb.reference();
    ref.child("CurrentUserId").set(userId);
  }
}
