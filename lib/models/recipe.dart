import 'package:flutter_project_1_0/models/ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String picture;
  final int numberOfingredients;
  late List<Ingredient> ingredientList;

  Recipe(this.id, this.name, this.picture, this.numberOfingredients, this.ingredientList);
}
