import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_project_1_0/models/favorite.dart';
import 'package:flutter_project_1_0/models/form_post_entry.dart';
import 'package:flutter_project_1_0/models/list_entry.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/models/recipe.dart';

// Souces:
// Setting up Firebase Realtime Database: https://medium.com/firebase-tips-tricks/how-to-use-firebase-realtime-database-with-flutter-ebd98aba2c91
// Reading and writing to Firebase Realtime Database: https://www.youtube.com/watch?v=Bper2K92bd8&ab_channel=BrandonDonnelson
// How to read Firebase Realtime Datase child data: https://stackoverflow.com/questions/52072948/flutter-get-firebase-database-reference-child-all-data
// Using StreamBuilders in Flutter: https://www.youtube.com/watch?v=sXBJZD0fBa4&t=2073s

class DatabaseService {
  // Set
  static Future<void> setRecipe(Recipe recipe) async {
    List<Map<String, dynamic>> result = [];
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
      "prepTime": recipe.prepTime,
      "totalTime": recipe.totalTime,
      "servings": recipe.servings,
      "numberOfingredients": recipe.numberOfingredients,
      "ingredientList": result,
      "method": recipe.method,
    });
  }

  static Future<void> setFavorite(Favorite favorite) async {
    List<Map<String, dynamic>> result = [];
    favorite.ingredientList.forEach((item) {
      result.add(item.toJson());
    });

    return FirebaseDatabase.instance
        .reference()
        .child("UserFavorite")
        .child(favorite.user)
        .child(favorite.id)
        .set({
      "name": favorite.name,
      "picture": favorite.picture,
      "prepTime": favorite.prepTime,
      "totalTime": favorite.totalTime,
      "servings": favorite.servings,
      "numberOfingredients": favorite.numberOfingredients,
      "ingredientList": result,
      "method": favorite.method,
    });
  }

  static Future<void> setForum(ListEntry listEntry) async {
    final newForum = <String, dynamic>{
      'id': listEntry.id,
      'title': listEntry.title,
      'question': listEntry.question,
      'date': listEntry.date,
      'user': listEntry.createdBy,
      'responses': listEntry.responses,
      'views': listEntry.views,
      'postEntries': [],
    };

    FirebaseDatabase.instance.reference().child('Forum').push().set(newForum);
  }

  static Future<void> setPost(ForumPostEntry post) async {
    final newPost = <String, dynamic>{
      'listEntryId': post.listEntryId,
      'username': post.username,
      'text': post.text,
      'hours': post.date,
      'likes': post.likes,
    };

    FirebaseDatabase.instance.reference().child('Posts').push().set(newPost);
  }

  static Future<void> setPlan(Plan plan) async {
    return FirebaseDatabase.instance
        .reference()
        .child("Plan")
        .child(plan.user)
        .child(plan.title)
        .set({"title": plan.title});
  }

  // Get
  static Future<Map<dynamic, dynamic>> getRecipes() async {
    Completer<Map<dynamic, dynamic>> completer =
        new Completer<Map<dynamic, dynamic>>();

    FirebaseDatabase.instance
        .reference()
        .child("Recipe")
        .once()
        .then((DataSnapshot snapshot) {
      if (snapshot.value == null) {
        completer.complete({});
      } else {
        Map<dynamic, dynamic> values = snapshot.value;
        completer.complete(values);
      }
    });

    return completer.future;
  }

  static Future<Map<dynamic, dynamic>> getFavorites(String userId) {
    Completer<Map<dynamic, dynamic>> completer =
        new Completer<Map<dynamic, dynamic>>();

    FirebaseDatabase.instance
        .reference()
        .child("UserFavorite")
        .child(userId)
        .once()
        .then((DataSnapshot snapshot) {
      if (snapshot.value == null) {
        completer.complete({});
      } else {
        Map<dynamic, dynamic> values = snapshot.value;
        completer.complete(values);
      }
    });

    return completer.future;
  }

  static Future<Map<dynamic, dynamic>> getPlanNames(String userId) async {
    Completer<Map<dynamic, dynamic>> completer =
        new Completer<Map<dynamic, dynamic>>();

    FirebaseDatabase.instance
        .reference()
        .child("Plan")
        .child(userId)
        .once()
        .then(
      (DataSnapshot snapshot) {
        if (snapshot.value == null) {
          completer.complete({});
        } else {
          Map<dynamic, dynamic> values = snapshot.value;
          completer.complete(values);
        }
      },
    );

    return completer.future;
  }

  static Future<Map<dynamic, dynamic>> getPlanRecipes(String userId, String plan) async {
    Completer<Map<dynamic, dynamic>> completer =
        new Completer<Map<dynamic, dynamic>>();

    FirebaseDatabase.instance
        .reference()
        .child("Plan")
        .child(userId)
        .child(plan)
        .once()
        .then(
      (DataSnapshot snapshot) {
        if (snapshot.value == null) {
          completer.complete({});
        } else {
          Map<dynamic, dynamic> values = snapshot.value;
          completer.complete(values);
        }
      },
    );

    return completer.future;
  }

    static Future<Map<dynamic, dynamic>> getRecipesFromPlan(Plan plan) async {
    Completer<Map<dynamic, dynamic>> completer =
        new Completer<Map<dynamic, dynamic>>();

    FirebaseDatabase.instance
        .reference()
        .child("Plan")
        .child(plan.user)
        .child(plan.title)
        .child("recipes")
        .once()
        .then(
      (DataSnapshot snapshot) {
        if (snapshot.value == null) {
          completer.complete({});
        } else {
          Map<dynamic, dynamic> values = snapshot.value;
          completer.complete(values);
        }
      },
    );

    return completer.future;
  }

  // Add
  static Future<void> addRecipeToPlan(Plan plan, Recipe recipe) async {
    return FirebaseDatabase.instance
        .reference()
        .child("Plan")
        .child(plan.user)
        .child(plan.title)
        .push()
        .set({"name": recipe.name, "picture": recipe.picture});
  }

  // Remove
  static Future<void> removeFavorite(Favorite favorite) async {
    FirebaseDatabase.instance
        .reference()
        .child("UserFavorite")
        .child(favorite.user)
        .child(favorite.id)
        .remove();
  }

  static Future<void> removePlan(Plan plan) async {
    FirebaseDatabase.instance
        .reference()
        .child("Plan")
        .child(plan.user)
        .child(plan.title)
        .remove();
  }
}
