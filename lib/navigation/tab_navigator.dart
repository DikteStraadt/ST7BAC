import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/blankPage.dart';
import 'package:flutter_project_1_0/screens/planPage.dart';
import 'package:flutter_project_1_0/screens/recipePage.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem, required this.user});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  final User user;

  @override
  Widget build(BuildContext context) {

    Widget child;

    if(tabItem == "Opskrifter")
      child = RecipePage(user: user);
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