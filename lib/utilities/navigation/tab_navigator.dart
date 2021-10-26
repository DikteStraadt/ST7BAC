import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/pages/blank_page.dart';
import 'package:flutter_project_1_0/pages/plans_page.dart';
import 'package:flutter_project_1_0/pages/recipes_page.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child;

    if(tabItem == "Opskrifter")
      child = RecipesPage();
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