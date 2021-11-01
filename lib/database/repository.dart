import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_project_1_0/models/favorite.dart';
import 'package:flutter_project_1_0/models/form_post_entry.dart';
import 'package:flutter_project_1_0/models/list_entry.dart';
import 'package:flutter_project_1_0/models/plan.dart';
import 'package:flutter_project_1_0/models/recipe.dart';

class Repository {
  
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
      'user': listEntry.createdBy,
      'responses': listEntry.responses,
      'views': listEntry.views,
      'postEntries': [],
    };

    FirebaseDatabase.instance
        .reference()
        .child('Forum')
        .push()
        .set(newForum);
  }

   static Future<void> setPost(ForumPostEntry post) async {
    final newPost = <String, dynamic>{
      'listEntryId': post.listEntryId,
      'username': post.username,
      'text': post.text,
      'hours': post.date,
      'likes': post.likes,
      'dislikes': post.dislikes,
    };

    FirebaseDatabase.instance
        .reference()
        .child('Posts')
        .push()
        .set(newPost);
  }

  static Future<void> setPlan(Plan plan) async {
    //List<Map<String, dynamic>> result = [];
    String string = plan.title.toString();

    return FirebaseDatabase.instance
        .reference()
        .child("Plan")
        .child(plan.user)
        .push()
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
      Map<dynamic, dynamic> values = snapshot.value;
      completer.complete(values);
    });

    return completer.future;
  }

  static Future<Map<dynamic, dynamic>> getFavorites(String userId) async {
    Completer<Map<dynamic, dynamic>> completer =
        new Completer<Map<dynamic, dynamic>>();

    FirebaseDatabase.instance
        .reference()
        .child("UserFavorite")
        .child(userId)
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      completer.complete(values);
    });

    return completer.future;
  }

  static Future<Map<dynamic, dynamic>> getPlans(String userId) async {
    Completer<Map<dynamic, dynamic>> completer =
        new Completer<Map<dynamic, dynamic>>();

    FirebaseDatabase.instance
        .reference()
        .child("Plan")
        .child(userId)
        .orderByChild("recipeId")
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      completer.complete(values);
    });

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
        .set({"recipeId": recipe.id});
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

  // Check
  static Future<bool> favoritesNotNull(String user) async {
    DataSnapshot snapshot = await FirebaseDatabase.instance
        .reference()
        .child("UserFavorite")
        .orderByChild(user)
        .equalTo("U1EL5623")
        .once();
    if (snapshot == null) {
      print("Item doesn't exist in the db");
    } else {
      print("Item exists in the db");
    }
    return snapshot != null;
  }
}
