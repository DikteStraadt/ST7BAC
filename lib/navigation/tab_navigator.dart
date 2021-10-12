import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/blankPage.dart';
import 'package:flutter_project_1_0/screens/planPage.dart';
import 'package:flutter_project_1_0/screens/recipePage.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child;

    if(tabItem == "Opskrifter")
      child = RecipePage();
    else if(tabItem == "Madplaner")
      child = PlanPage();
    else
      child = BlankPage();
    
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child
        );
      },
    );
  }
}