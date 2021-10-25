import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';

class Recipes {
  List<Recipe> _recipes = [];

  List<Recipe> loadRecipes() {
    // Mexikansk risret
    List<Ingredient> mexicansk_risret_i = [
      new Ingredient("løg", 2, ""),
      new Ingredient("hvidløg", 4, "fed"),
      new Ingredient("gulerødder", 2, ""),
      new Ingredient("squash", 1, ""),
      new Ingredient("rød chili", 1, ""),
      new Ingredient("spidskommen", 2, "tsk"),
      new Ingredient("stødt koriander", 2, "tsk"),
      new Ingredient("kanel", 0.5, "tsk"),
      new Ingredient("røget paprika", 2, "tsk"),
      new Ingredient("basmati ris", 300, "g"),
      new Ingredient("grøntsagsbouillon", 6, "dl"),
      new Ingredient("hakkede tomater", 1, "dåser"),
      new Ingredient("sorte bønner", 1, "dåse"),
      new Ingredient("majs", 140, "g"),
      new Ingredient("rød peberfrugt", 2, ""),
      new Ingredient("cherrytomater", 20, ""),
      new Ingredient("olivenolie", 3, "spsk"),
      new Ingredient("flagesalt", 0, ""),
      new Ingredient("sort peber", 0, ""),
      new Ingredient("avocado", 1, ""),
      new Ingredient("frisk koriander", 1, "håndfuld"),
      new Ingredient("cheddar ost", 125, "g"),
      new Ingredient("chilisauce", 1, "spsk"),
    ];
    Recipe mexicansk_risret = new Recipe(
      "mexicansk-risret",
      "Mexikansk risret",
      "lib/assets/recipes/mexicansk-risret.jpg",
      "30 min.",
      "45 min.",
      4,
      23,
      mexicansk_risret_i,
      "Kom løg, hvidløg og gulerødder i en gryde med olie og sauter ved middelvarme, til løgene er bløde og klare. Tilsæt squash, rød chili, spidskommen, koriander, kanel, røget paprika og rør godt sammen.\n\nKom basmatirisene i en sigte og skyl dem meget grundigt. Rør dem derefter i gryden sammen med grøntsagsboullion og hakkede tomater. Bring i kog under omrøring, skru ned for varmen og lad det simre under låg i 15 minutter.\n\nTilsæt bønner, majskerner og rød peberfrugt og varm igen op til kogepunktet. Læg låg på og sluk for varmen. Lad retten trække smag og risene blive møre i 15 minutter.\n\nSmag til med salt og peber. Rør tomaterne i og anret risretten på et fad med tilbehøret til servering.\n",
    );
    _recipes.add(mexicansk_risret);

    // Mexikansk risret
    List<Ingredient> one_pot_pasta_i = [
      new Ingredient("spaghetti", 400, "g"),
      new Ingredient("hakkede tomater", 1, "dåse"),
      new Ingredient("frisk basilikum", 1, "håndfuld"),
      new Ingredient("løg", 1, ""),
      new Ingredient("hvidløg", 2, "fed"),
      new Ingredient("cherrytomater", 20, ""),
      new Ingredient("squash", 1, ""),
      new Ingredient("oregano", 1, "tsk"),
      new Ingredient("chorizo", 50, "g"),
      new Ingredient("grøntsagsbouillon", 5, "dl"),
      new Ingredient("olivenolie", 2, "spsk"),
      new Ingredient("chiliflager", 1, "tsk"),
      new Ingredient("salt", 1, "tsk"),
      new Ingredient("sort peber", 0, ""),
      new Ingredient("parmesan", 50, "g"),
      new Ingredient("frisk basilikum", 1, "håndfuld"),
    ];
    Recipe one_pot_pasta = new Recipe(
        "one-pot-pasta",
        "One pot pasta",
        "lib/assets/recipes/one-pot-pasta.jpg",
        "10 min.",
        "25 min.",
        4,
        24,
        one_pot_pasta_i,
        "Helt enkelt som navnet antyder, så kom alle ingredienserne i en stor gryde på én gang.\n\nKog retten op, rør godt rundt i gryden og skru ned for varmen.\n\nLad det simrekoge under låg i 10-12 minutter, til spaghettien er perfekt kogt – al dente med lidt bid i.\n\nServer med revet parmesan og basilikum.\n");
    _recipes.add(one_pot_pasta);

    // Vegetar spaghetti
    List<Ingredient> vegetar_spaghetti_i = [
      new Ingredient("løg", 2, ""),
      new Ingredient("hvidløg", 2, "fed"),
      new Ingredient("hakkede tomater", 2, "dåser"),
      new Ingredient("frisk timian", 1, "spsk"),
      new Ingredient("tomatpuré", 5, "spsk"),
      new Ingredient("æblecidereddike", 4, "spsk"),
      new Ingredient("soltørrede tomater", 1, "spsk"),
      new Ingredient("smør", 1, "spsk"),
      new Ingredient("salt", 0, ""),
      new Ingredient("sort peber", 0, ""),
      new Ingredient("quinoa", 100, "g"),
      new Ingredient("grønne linser", 50, "g"),
      new Ingredient("grøntsagsbouillon", 4, "dl"),
      new Ingredient("champignon", 100, "g"),
      new Ingredient("æg", 2, ""),
      new Ingredient("rødløg", 1, "stk"),
      new Ingredient("hvidløg", 3, "fed"),
      new Ingredient("persille", 1, "håndfuld"),
      new Ingredient("stødt spidskommen, tørret", 2, "tsk"),
      new Ingredient("timian, tørret", 1, "tsk"),
      new Ingredient("oregano", 1, "tsk"),
      new Ingredient("feta", 75, "g"),
      new Ingredient("spaghetti", 350, "g"),
      new Ingredient("parmesan", 75, "g"),
      new Ingredient("frisk timian", 1, "håndfuld"),
    ];
    Recipe vegetar_spaghetti = new Recipe(
        "vegetar-spaghetti",
        "Vegetar Spaghetti",
        "lib/assets/recipes/vegetar-spaghetti.jpg",
        "45 min.",
        "60 min.",
        4,
        16,
        vegetar_spaghetti_i,
        "Tomatsauce\nKom løg og hvidløg i gryden med smør og sauter, til løgene er klare og bløde. Tilsæt alle de andre ingredienser. Lad det simre uden låg, mens resten af retten tilberedes.\n\nBlend evt. saucen med en stavblender, hvis du ønsker en fin og ensartet konsistens.\n\nQuinoa- og linseboller\nSkyl quinoa og linser grundigt i en sigte og kom dem derefter i en gryde sammen med grøntsagsbouillon.\n\nLæg låg på, bring i kog og lad det simre i 20 minutter, til linserne er knap møre.\n\nKom de kogte linser og quinoa i en skål og rør grundigt sammen med champignoner, æg, rødløg, hvidløg, per­sille, krydderier, smuldret feta, salt og peber. Form en masse små boller af farsen.\n\nLæg dem på en bageplade med bagepapir og bag i ovnen ved 175 grader i 25­-30 minutter.\n\nKog imens pastaen al dente efter anvisning på pakken.\n\nServer quinoa og linsebollerne med spaghetti, varm tomatsauce og rigeligt revet parmesan og lidt timian til at drysse over.\n");
    _recipes.add(vegetar_spaghetti);

    return _recipes;
  }
}
// _buildCard("vegetar-spaghetti"),
// _buildCard("crispy-kylling"),
// _buildCard("porretaerte"),
// _buildCard("graeskarsuppe"),
