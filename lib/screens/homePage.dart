import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/navigation/navigationbar.dart';
import 'blankPage.dart';

class HomePage extends StatelessWidget {

  final List<String> menuButtons = [
    "Opskrifter",
    "Aktiviteter",
    "Medier",
    "Forum",
    "Vejledning",
    "Events"
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/zebra.png"), fit: BoxFit.cover),), child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: GridView(
            physics: BouncingScrollPhysics(), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: menuButtons.map((title){
              return GestureDetector(
                child: Card(
                  margin: const EdgeInsets.all(20.0),
                  child: getCardByTitle(title)),
                onTap: (){
                  if(title == "Opskrifter")
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Navigationbar()));
                  else
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BlankPage()));
              },);
            }).toList(),
        ),
    ),));


      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text('Log ud'),
      //   ),
      // )

  }

  Column getCardByTitle(String title) {
    String img = "";
    if(title == "Opskrifter")
      img = "lib/assets/aesel.png";
    else if(title == "Aktiviteter")
      img = "lib/assets/gepard.png";
    else if(title == "Medier")
      img = "lib/assets/baever.png";
    else if(title == "Forum")
      img = "lib/assets/koala.png";
    else if(title == "Vejledning")
      img = "lib/assets/struds.png";
    else
      img = "lib/assets/giraf.png";
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
              child: new Stack(
            children: <Widget> [
              new Image.asset(
                img,
                width: 80.0,
                height: 80.0,
              )
            ],)
          ),
        ),Text(title,style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
      ],
    );
  }
}