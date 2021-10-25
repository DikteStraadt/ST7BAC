import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_project_1_0/models/favorite.dart';
import 'package:flutter_project_1_0/models/plan.dart';
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

  static Future<void> setPlan(Plan plan) async {
    List<Map<String, dynamic>> result = [];
    if (plan.recipesList[0].name != "") {
      plan.recipesList.forEach((item) {
        result.add(item.toJson());
      });
      return FirebaseDatabase.instance
          .reference()
          .child("Plan")
          .child(plan.user)
          .child(plan.title)
          .set({
        "recipe": result,
      });
    } else {
      return FirebaseDatabase.instance
          .reference()
          .child("Plan")
          .child(plan.user)
          .child(plan.title)
          .child("path")
          .set({"id": "Denne madplan er endnu tom"});
    }
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
        .child(recipe.id)
        .set("");
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
