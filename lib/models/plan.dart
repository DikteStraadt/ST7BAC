import 'package:flutter_project_1_0/models/recipe.dart';

class Plan {
  
  final String user;
  final String title;
  late List<Recipe> recipesList;

  Plan(this.user, this.title, this.recipesList);
}