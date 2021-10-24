import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/models/recipe.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
  const RecipePage({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              FittedBox(
                child: Container(
                  color: Colors.teal[400],
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.recipe.name,
                          style: TextStyle(
                              fontFamily: 'Margarine',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.015),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Image.asset(widget.recipe.picture),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.025),
                        Row(
                          children: [
                            Expanded(
                              child: Text("Tid i alt: 45 min.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Margarine',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035),
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: Text("Antal: 4 pers.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Margarine',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035),
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
                              child: Text("Arbejdstid: 30 min.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Margarine',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035),
                                  textAlign: TextAlign.center),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.015)
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.025),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.025),
              FittedBox(
                child: Container(
                  color: Colors.teal[400],
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.025),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Ingredienser",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Margarine',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Fremgangsmåde",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Margarine',
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.025),
                                  Text(
                                    "2 løg, finthakket\n\n4 fed hvidløg, finthakket\n\n2 gulerod, skåret i små tern\n\n1 squash, groftrevet\n\n0,50 rød chili, uden kernehus og finthakker (tilføj mere efter smag)\n\n2 tsk stødt spidskommen\n\n",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.025),
                                  Text(
                                    "Kom løg, hvidløg og gulerødder i en gryde med olie og sauter ved middelvarme, til løgene er bløde og klare. Tilsæt squash, rød chili, spidskommen, koriander, kanel, røget paprika og rør godt sammen.\n\nKom basmatirisene i en sigte og skyl dem meget grundigt. Rør dem derefter i gryden sammen med grøntsagsboullion og hakkede tomater. Bring i kog under omrøring, skru ned for varmen og lad det simre under låg i 15 minutter.\n\nTilsæt bønner, majskerner og rød peberfrugt og varm igen op til kogepunktet. Læg låg på og sluk for varmen. Lad retten trække smag og risene blive møre i 15 minutter.\n\nSmag til med salt og peber. Rør tomaterne i og anret risretten på et fad med tilbehøret til servering.\n",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Tilføj til madplan',
                    style: TextStyle(
                        fontFamily: 'Margarine',
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[600],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Udskriv indkøbsliste',
                    style: TextStyle(
                        fontFamily: 'Margarine',
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[600],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Tilføj til favoritter',
                    style: TextStyle(
                        fontFamily: 'Margarine',
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[600],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
