import 'package:flutter_project_1_0/models/ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String picture;
  final int numberOfingredients;
  late List<Ingredient> ingredientList;

  Recipe(this.id, this.name, this.picture, this.numberOfingredients, this.ingredientList);
  
  Recipe.json({
    required this.id,
    required this.name,
    required this.picture,
    required this.numberOfingredients,
    required this.ingredientList,
  });

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'picture': picture,
  //       'numberOfIngredients': numberOfingredients,
  //       'ingredientList': ingredientList
  //     };
}
