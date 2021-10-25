import 'package:flutter_project_1_0/models/ingredient.dart';

class Favorite {
  final String user;
  final String id;
  final String name;
  final String picture;
  final String prepTime;
  final String totalTime;
  final int servings;
  final int numberOfingredients;
  late List<Ingredient> ingredientList;
  final String method;

  Favorite(this.user, this.id, this.name, this.picture, this.prepTime, this.totalTime, this.servings, this.numberOfingredients, this.ingredientList, this.method);
}
