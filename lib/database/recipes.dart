import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';

class Recipes {
  List<Recipe> _recipes  = [];

  List<Recipe> loadRecipes() {
    // Mexikansk risret
    List<Ingredient> mexicansk_risret_i = [
      new Ingredient("Gulerødder", 2, "stk."),
      new Ingredient("Hakkede tomater", 1, "dåse")
    ];
    Recipe mexicansk_risret =
        new Recipe("mexicansk-risret", "Mexikansk risret", "lib/assets/mexicansk-risret.jpg", 2, mexicansk_risret_i);
    _recipes.add(mexicansk_risret);

    // Mexikansk risret
    List<Ingredient> one_pot_pasta_i = [
      new Ingredient("Pasta", 200, "g"),
      new Ingredient("Squash", 0.5, "stk.")
    ];
    Recipe one_pot_pasta =
        new Recipe("one-pot-pasta", "One pot pasta", "lib/assets/one-pot-pasta.jpg", 2, one_pot_pasta_i);
    _recipes.add(one_pot_pasta);

    // Vegetar spaghetti
    List<Ingredient> vegetar_spaghetti_i = [
      new Ingredient("Pasta", 200, "g"),
      new Ingredient("Squash", 0.5, "stk.")
    ];
    Recipe vegetar_spaghetti =
        new Recipe("vegetar-spaghetti", "Vegetar Spaghetti", "lib/assets/vegetar-spaghetti.jpg", 2, vegetar_spaghetti_i);
    _recipes.add(vegetar_spaghetti);

    return _recipes;   
  }
}

            // _buildCard("vegetar-spaghetti"),
            // _buildCard("crispy-kylling"),
            // _buildCard("porretaerte"),
            // _buildCard("graeskarsuppe"),
