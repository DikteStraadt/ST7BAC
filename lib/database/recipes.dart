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
        "lib/assets/recipes/ovnbagte_falafler.png",
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
        "lib/assets/recipes/sod_kartoffelmos.png",
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
        "lib/assets/recipes/vegansk_dhal.png",
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
        "Vegetarisk lasagne",
        "lib/assets/recipes/vegetarisk_lasange.png",
        "30 min.",
        "70 min.",
        4,
        6,
        vegetarisk_lasange_i,
        "Fremgangsmåde:\n\nTag en stor gryde frem og kom olivenolien, hakkede løg, forårsløg (valgfrit) og hvidløg i gryden, og lad det simre på middelvarme til løgene er bløde men endnu ikke blevet brune. Kom herefter tomatpuré, salt og peber ned i gryden. Skru varmen op mens du rører det godt rundt i et par minutter (pas på det ikke brænder på). Skru herefter ned for varmen og lad blandingen stå i 2-3 min. (Evt. med omrøring halvvejs, så det ikke brænder fast).\n\nKom begge dåser hakket tomater ned i gryden, jeg plejer at skylle dåserne med vand (ca. så vandet fylder halvdelen af dåsen) og komme det ned i gryden. Kom herefter de røde linser i gryden og rør rundt, så det hele er blandet godt sammen. Lad gryden stå og simre med låg på i 15 min (evt. med omrøring 1-2 gange, så det ikke brænder fast). Kom herefter kidney bønnerne, oregano og chili i gryden og rør rundt (jeg kommer ca. 3 spsk. oregano i og chili efter hvor stærk jeg ønsker lasangen). Lad det stå og simre med låg på i ca. 5 min. \n\nRiv gulerødder og squash, og kom det hele i gryden. Hak peberfrugten fint og kom den ned i gryden og rør det hele rundt. Lad det simre yderlig i ca. 5 min. med låg på og smag herefter til med salt, peber, oregano og chili. Lad retten simre igen (gerne så længe som muligt – Det er her alt den gode smag kommer frem).\n\n\n\nSamling af lasagne:\n\nJeg kommer ca. 2 spsk. af mornaysaucen ned i fadet og fordeler det jævnt rundt, for at pastapladerne slipper nemmere når lasagnen er færdig.\n\nHerefter, ligger jeg lasagnepladerne på, så de dækker bunden og kommer et godt lag af sovsen oven på. Jeg plejer kun at lave to lag og vil hellere lave dem ”tykke” og skære ned på lasagnepladerne. Herefter kommer jeg 1/3 af mornaysaucen oven på. Gentag, så du får i alt to lag.\n\nTil slut, ligger jeg et sidste lag af lasagneplader og kommer resten af mornaysaucen på. Herefter, fordeler jeg osten ud på toppen og drysser med oregano (Jeg elsker oregano er og er derfor lidt rundhåndet, men man kan eventuelt også kommer lidt chiliflager på toppen, hvis man godt kan lide det).\n\n\n\nTilberedning af lasagne:\n\nOvnen sætter jeg på 200 grader varmluft. Jeg kommer sølvpapir over lasagnen for, at osten ikke bliver brændt, og kommer lasagnen i ovnen i 20 min. Herefter, tager jeg sølvpapiret af, og lader den blive i ovnen i ca. 10 min. ekstra.\n\nBruger jeg ikke friske lasagne plader kommer jeg lasagnen i ovnen med sølvpapir i 30 min. og derefter 10 min. uden sølvpapir.");
    _recipes.add(vegetarisk_lasange);

    // Ovnbagte kikærter
    List<Ingredient> ovnbagte_kikaerter_i = [
      new Ingredient("kikærter", 1, "dåse"),
      new Ingredient("olivenolie", 3, "spsk."),
      new Ingredient("sort peber", 1, "tsk."),
      new Ingredient("paprika", 1, "tsk."),
      new Ingredient("hvidløgspulver", 1, "tsk."),
      new Ingredient("spidskommen", 1, "tsk."),
      new Ingredient("chili", 1, "knivspids"),
      new Ingredient("salt", 1, "tsk."),
    ];
    Recipe ovnbagte_kikaerter = new Recipe(
        "ovnbagte_kikaerter",
        "Ovnbagte kikærter",
        "lib/assets/recipes/ovnbagte_kikaerter.png",
        "5 min.",
        "25 min.",
        1,
        8,
        ovnbagte_kikaerter_i,
        "Tænd ovnen på 200 grader varmluft. \n\nKom kikærterne i en si og skyl dem i koldt vand, tør dem og kom dem derefter over i en skål.\n\nTilsæt krydderierne og chili efter eget behov, jeg bruger lidt mindre end ½ tsk. Du kan sagtens eksperimentere med krydderierne, alt efter hvilke du synes smager bedst sammen eller hvad du lige har i skabet.\n\nSpred kikærterne ud på en bageplade og drys salt over dem. Giv dem 20 min. i ovnen. Du kan eventuelt lige ”vende” dem rundt med en ske efter 10 min.\n\nLad dem køle af og kom dem i en skål til snacks eller over en salat til aftensmaden. De smager fantastisk sammen med min opskrift på Hasselback butternut squash og som topping til min opskrift på grønkålssalt.");
    _recipes.add(ovnbagte_kikaerter);

    // Hokkaidosuppe
    List<Ingredient> hokkaidosuppe_graeskarsuppe_i = [
      new Ingredient("hokkaido græskar", 1, "stk."),
      new Ingredient("løg", 1, ""),
      new Ingredient("hvidløg", 2, "fed"),
      new Ingredient("gulerødder", 2, ""),
      new Ingredient("kartofler", 4, ""),
      new Ingredient("frisk chili", 1, ""),
      new Ingredient("ingefær", 1, "lille klump"),
      new Ingredient("plantefløde", 2, "dl"),
      new Ingredient("grøntsagsbouillon", 1, "liter"),
      new Ingredient("spidskommen", 1, "tsk."),
      new Ingredient("citronsaft ", 1, "spsk."),
      new Ingredient("tørrede græskarkerne", 40, "g"),
      new Ingredient("saltede mandler", 40, "g"),
      new Ingredient("æbler", 2, ""),
      new Ingredient("rødelinser ", 100, "g"),
      new Ingredient("salt", 1, "tsk."),
      new Ingredient("peber", 1, "knivspids"),
    ];
    Recipe hokkaidosuppe_graeskarsuppe = new Recipe(
        "hokkaidosuppe_graeskarsuppe",
        "Hokkaidosuppe",
        "lib/assets/recipes/hokkaidosuppe_graeskarsuppe.png",
        "20 min.",
        "40 min.",
        4,
        17,
        hokkaidosuppe_graeskarsuppe_i,
        "Suppe:\n\nSkræl ingefær og skær det i mindre tern sammen med hvidløg og chilli. Brug hellere lidt mindre chilli, der kan altid komme mere i senere. Kom det i en gryde med enten olie eller smør, og steg det på middelhøj varme.\n\nSkær hokkaido græskar, løg, gulrødder og kartofler i grove tern og kom dem ned i gryden. Steg dem af i et par minutter. Kom grøntsagsbouillon op i gryden, ca. så det dækker 2/3 af grøntsagerne. Kom låg på og lad det simre i minimum 20 min.\n\n\n\nTopping: \n\nI mellemtiden kommer du dine rødelinser op i en lille gryde og kommer vand i til det lige dækker linserne. Kom lidt slat og pepper i. Lad det koge vandet ind med låg på. Skær æblerne ud i små tern.\n\nTænd ovnen på 200 grader varmluft. Mandlerne rister du på en pande. Inden de begynder at tage farve kommer du vand og salt på panden. Rør rundt til alt vand er fordampet og saltet har lagt sig som en hvid hinde rundt om mandlerne. Kom dem på en bradepande og ind i ovnen i 5-10 min.\n\n\n\nSuppe:\n\nNår grøntsagerne er blevet kogt møre kommer ud dem op i en blender, og blender det til en jævn masse. Alternativt kan du bruge en stavblender.\n\nKom suppen over i gryden igen og kom plantefløden i. Lad det koge op og skru så ned for varmen igen. Kom spidskommen i. Smag til med salt, peber, citronsaft og mere chilli hvis der er behov for dette. Eventuelt kom lidt mere vand i, hvis suppen er for tyk.\n\nKom topping på og server.");
    _recipes.add(hokkaidosuppe_graeskarsuppe);

    // //XXXX
    // List<Ingredient> sod_kartoffelmos_i = [
    //   new Ingredient("sød kartoffel", 700, "g"),
    //   new Ingredient("", 1, ""),
    // ];
    // Recipe sod_kartoffelmos = new Recipe(
    //     "sod_kartoffelmos",
    //     "Sød kartoffelmos",
    //     "lib/assets/recipes/sod_kartoffelmos.png",
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
