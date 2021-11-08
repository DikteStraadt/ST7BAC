import 'package:flutter_project_1_0/models/ingredient.dart';
import 'package:flutter_project_1_0/models/recipe.dart';

class Recipes {
  List<Recipe> _recipes = [];

  List<Recipe> loadRecipes() {
    // Ovnbagte falafler
    List<Ingredient> ovnbagte_falafler_i = [
      new Ingredient("kikærter", 2, "dåser"),
      new Ingredient("tahin ", 1, "spsk."),
      new Ingredient("hvidløg", 2, "fed"),
      new Ingredient("løg", 1, "stk."),
      new Ingredient("æg", 1, "stk."),
      new Ingredient("frisk persille", 2, "håndfulde"),
      new Ingredient("havregryn", 2, "spsk."),
      new Ingredient("bagepulver", 1, "tsk."),
      new Ingredient("spidskommen", 1, "tsk."),
      new Ingredient("cayennepeber", 1, "tsk."),
      new Ingredient("citronsaft ", 2, "spsk."),
      new Ingredient("salt", 1, "tsk."),
      new Ingredient("peber", 1, "knivspids"),
    ];
    Recipe ovnbagte_falafler = new Recipe(
        "ovnbagte_falafler",
        "Ovnbagte falafler",
        "lib/assets/recipes/ovnbagte_falafler.jpg",
        "15 min.",
        "40 min.",
        4,
        13,
        ovnbagte_falafler_i,
        "Tænd ovnen på 200 grader varmluft. Hæld vandet fra kikærterne og kom det op i blenderen/foodprocessoren, sammen med tahin, hvidløg, løg og bagepulver. Blend det hele sammen til en fin/jævn masse. Alternativt kan du blende det med en stavblender.\n\nHak persillen groft, kom det ned i skålen sammen med æg, havregryn, krydderierne, citronsaften og salt efter behov.  Rør det hele godt sammen.\n\nForm små klatter med en ske, og kom det på en bageplade og ind i ovnen.\n\nTag dem ud når de er gyldne i farven.");
    _recipes.add(ovnbagte_falafler);

    // Sød kartoffelmos
    List<Ingredient> sod_kartoffelmos_i = [
      new Ingredient("sød kartoffel", 700, "g"),
      new Ingredient("granatæble", 1, "stk."),
      new Ingredient("græsk fetaost", 100, "g"),
      new Ingredient("frisk basilikum", 1, "håndfuld"),
    ];
    Recipe sod_kartoffelmos = new Recipe(
        "sod_kartoffelmos",
        "Sød kartoffelmos",
        "lib/assets/recipes/sod_kartoffelmos.jpg",
        "10 min.",
        "35 min.",
        4,
        4,
        sod_kartoffelmos_i,
        "Tænd ovnen på 200 grader varmluft.\n\nSkyl søde kartoflerne og skær dem i grove tern. Kom dem på en bageplade og ind i ovnen i ca. 20-25 min. Eller til de er møre, tjek med en gaffel, at den nemt kan stikkes i.\n\nPil granatæblet, jeg plejer at skære dem over i 4 dele, og så pille kernerne fra, ved at vende skrællen på vrangen.\n\nSkyl og hak groft basilikum, eventuelt lad et par balde forblive hele, til at pynt med.\n\nNår søde kartoflerne er færdige i ovnen, kom dem i en skål, og mos dem med en kartoffelmoser eller stavblender. Smuldre herefter fetaosten i, og vend det forsigtigt sammen.\n\nKom basilikum og granatæblekernerne i, og vend det hele forsigtigt sammen.\n\nKom det hele i en lidt finere skål og lig basilikum på toppen.\n\nDen er nu klar til at blive serveret.");
    _recipes.add(sod_kartoffelmos);

    //Vegansk dahl
    List<Ingredient> vegansk_dhal_i = [
      new Ingredient("løg", 700, "g"),
      new Ingredient("hvidløg", 2, "fed"),
      new Ingredient("forårsløg", 2, ""),
      new Ingredient("squash", 1, ""),
      new Ingredient("gulerødder", 2, ""),
      new Ingredient("rød peber", 1, ""),
      new Ingredient("kikærter", 1, "dåse"),
      new Ingredient("røde linser", 3, "dl"),
      new Ingredient("karrypulver", 2, "tsk."),
      new Ingredient("rød karry paste", 2, "tsk."),
      new Ingredient("kokosmælk", 2, "dåse"),
      new Ingredient("kokosolie", 3, "spsk."),
      new Ingredient("koriander", 1, "lille håndfuld"),
      new Ingredient("salt", 1, "tsk."),
      new Ingredient("peber", 1, "knivspids"),
    ];
    Recipe vegansk_dhal = new Recipe(
        "vegansk_dhal",
        "Vegansk dhal",
        "lib/assets/recipes/vegansk_dhal.jpg",
        "10 min.",
        "35 min.",
        4,
        15,
        vegansk_dhal_i,
        "Tag en stor gryde eller en pande med høje kanter (evt. en wokpande). Varm den op på høj varme og kom kokosolie, løg og hvidløg på panden (jeg bruger jomfru kokosolie fordi den både giver smag og kan tåle høj varme. Bruger du andet fedtstof, så skru ned for varmen, så du ikke ødelægger fedtstoffet). \n\nLad løg og hvidløg simre i et minuts tid ved rolig omrøring, så det ikke brænder fast ved den høje varme. Kom herefter karrypulver på panden og lad det igen simre i et minuts tid ved rolig omrøring.\n\nKom herefter broccoli på panden og lad dem ligge til de bliver svagt mørkere i farven (mørkegrøn). Kom begge dåser kokosmælk og røde linser på panden og rør rundt så karrypulveret giver kokosmælken en ensartet farve. \n\nKom låg på panden til det koger. Kikærterne skyller du i en si og kommer på panden sammen med salt og peber. Rør rundt og kom derefter låg på og skru ned på middel varme. Lad retten simre i 10 min. Evt. med omrøring halvvejs for, at det ikke brænder på. Koger retten skal der skrues ned, retten skal kun simre.\n\nSmag retten til og kom evt. mere salt og peber i efter behov.\n\nKom squash, gulerødder, rødpeber og karry paste på panden og rør rundt. Kom igen låg på og lad retten simre i 10 min. Evt. med omrøring halvvejs for at det ikke brænder på. Igen koger retten skal der skrues ned, retten skal kun simre.\n\nKom forårsløg og koriander på panden og rør det rundt til det er blandet godt ind i retten. Den er nu klar til servering. Jeg brugte en stor håndfuld koriander, som jeg delte op i to bunker. Den ene skar jeg stænglerne af på og kom dem over i den anden bunke. Bunken med stængler hakkede jeg groft og kom ned i retten. Bunken uden stængler hakkede jeg fint og brugte som pynt på retten. \n\nJeg lavede rette med grillede fladbrød til, men den kan både spises med naanbrød, ris, bulgur eller anden form for brød eller ”rissort”.");
    _recipes.add(vegansk_dhal);
  
    // Vegetarisk lasagne
    List<Ingredient> vegetarisk_lasange_i = [
      new Ingredient("løg", 2, ""),
      new Ingredient("hvidløg", 2, ""),
      new Ingredient("forårsløg", 1, ""),
      new Ingredient("squash", 1, ""),
      new Ingredient("gulerødder", 2, ""),
      new Ingredient("rød peberfrugter", 1, ""),
      new Ingredient("røde linser", 3, "dl"),
      new Ingredient("røde kidney bønner", 1, "dåse"),
      new Ingredient("hakkede tomater", 2, "dåser"),
      new Ingredient("tomatpure", 140, "g"),
      new Ingredient("olivenolie", 2, "spsk."),
      new Ingredient("mornaysauce", 400, "ml"),
      new Ingredient("revet mozzarella ost", 300, "g"),
      new Ingredient("lasagneplader", 400, "g"),
      new Ingredient("salt", 1, "tsk."),
      new Ingredient("peber", 1, "knivspids"),
      new Ingredient("chili", 1, "knivspids"),
    ];
    Recipe vegetarisk_lasange = new Recipe(
        "vegetarisk_lasange",
        "Vegetatisk lasagne",
        "lib/assets/recipes/vegetarisk_lasange.jpg",
        "30 min.",
        "70 min.",
        4,
        6,
        vegetarisk_lasange_i,
        "");
    _recipes.add(vegetarisk_lasange);
    
    // //XXXX
    // List<Ingredient> sod_kartoffelmos_i = [
    //   new Ingredient("sød kartoffel", 700, "g"),
    //   new Ingredient("", 1, ""),
    // ];
    // Recipe sod_kartoffelmos = new Recipe(
    //     "sod_kartoffelmos",
    //     "Sød kartoffelmos",
    //     "lib/assets/recipes/sod_kartoffelmos.jpg",
    //     "10 min.",
    //     "35 min.",
    //     4,
    //     4,
    //     sod_kartoffelmos_i,
    //     "");
    // _recipes.add(sod_kartoffelmos);

    return _recipes;
  }
}
