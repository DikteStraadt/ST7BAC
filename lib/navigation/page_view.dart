import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/pages/favorites_page.dart';
import 'package:flutter_project_1_0/pages/plan_page.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';

class PageViewController extends StatefulWidget {
  @override
  _PageViewControllerState createState() => _PageViewControllerState();
}

class _PageViewControllerState extends State<PageViewController> {

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        RecipePage(),
        PlanPage(),
        FavoritesPage(),
      ],
    );
  }
}