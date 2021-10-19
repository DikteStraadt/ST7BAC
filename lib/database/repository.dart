import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_project_1_0/models/recipe.dart';
import 'package:flutter_project_1_0/models/user.dart';

class Repository {
  // Set
  static Future<void> setCurrentUser(String userId) async {
    return FirebaseDatabase.instance
        .reference()
        .child("CurrentUserId")
        .set(userId);
  }

    static Future<void> setRecipe(Recipe recipe) async {
      List<Map<String,dynamic>> result = [];
        recipe.ingredientList.forEach((item) {
          result.add(item.toJson());
        });

    return FirebaseDatabase.instance
        .reference()
        .child("Recipe")
        .child(recipe.id)
        .set({
         "name": recipe.name,
         "picture": recipe.picture,
         "numberOfingredients": recipe.numberOfingredients,
         "ingredientList": result,
      });
  }

  // Get
  static Future<User> getCurrentUser() async {
    Completer<User> completer = new Completer<User>();

    FirebaseDatabase.instance
        .reference()
        .child("CurrentUserId")
        .once()
        .then((DataSnapshot snapshot) {
      var user = new User(snapshot.value);
      completer.complete(user);
    });

    return completer.future;
  }

  static Future<Map<dynamic, dynamic>> getRecipes() async {
    Completer<Map<dynamic, dynamic>> completer = new Completer<Map<dynamic, dynamic>>();

    FirebaseDatabase.instance
        .reference()
        .child("Recipe")
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      completer.complete(values);
    });

    return completer.future;
  }
}
