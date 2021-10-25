import 'package:flutter_project_1_0/models/ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String picture;
  final String prepTime;
  final String totalTime;
  final int servings;
  final int numberOfingredients;
  late List<Ingredient> ingredientList;
  final String method;

  Recipe(this.id, this.name, this.picture, this.prepTime, this.totalTime, this.servings, this.numberOfingredients, this.ingredientList, this.method);
  
  Recipe.json({
    required this.id,
    required this.name,
    required this.picture,
    required this.prepTime,
    required this.totalTime,
    required this.servings,
    required this.numberOfingredients,
    required this.ingredientList,
    required this.method
  });
}
