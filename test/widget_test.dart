import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/pages/recipe_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_1_0/pages/home_page.dart';
import 'package:flutter_project_1_0/pages/login_page.dart';
import 'package:flutter_project_1_0/pages/recipes_page.dart';

void main() {
  Widget widgetForTesting({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Login page smoke test', (WidgetTester tester) async {
    // Build the app and trigger trigger login page
    await tester.pumpWidget(widgetForTesting(child: new LoginPage()));

    //Create the finder
    final titleFinder = find.text('Hånd i hånd');

    //verify that the specified text widget appears exactly once in the widget tree
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Home page smoke test', (WidgetTester tester) async {
    // Build the app and trigger trigger home page
    await tester.pumpWidget(widgetForTesting(child: new HomePage()));

    //Create the finders
    final titleFinder = find.text('Hånd i hånd');

    //verify that the specified text widget appears exactly once in the widget tree
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Home page recipes finder', (WidgetTester tester) async {
    //arrange
    // Build the app and trigger trigger home page
    await tester.pumpWidget(widgetForTesting(child: new HomePage()));

    //Create the finder
    final recipesFinder = find.text('Opskrifter');

    //act

    //assert
    //verify that the specified text widget appears exactly once in the widget tree
    expect(recipesFinder, findsOneWidget);
  });

  testWidgets('Home page activities finder', (WidgetTester tester) async {
    //arrange
    // Build the app and trigger trigger home page
    await tester.pumpWidget(widgetForTesting(child: new HomePage()));

    //Create the finder
    final activitiesFinder = find.text('Aktiviteter');

    //act

    //assert
    //verify that the specified text widget appears exactly once in the widget tree
    expect(activitiesFinder, findsOneWidget);
  });

  //The following test of the favorite icon can't be run without mocking Firebase, see further in appendix 1.5 Test
  //Inspired by: https://codelabs.developers.google.com/codelabs/flutter-app-testing#5
  /*  testWidgets('Testing favorite icon', (tester) async {
    await tester.pumpWidget(widgetForTesting(child: new RecipesPage()));
    expect(find.byIcon(Icons.favorite), findsNothing);
    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pumpAndSettle(Duration(seconds: 1));
    expect(find.byIcon(Icons.favorite), findsWidgets);
    await tester.tap(find.byIcon(Icons.favorite).first);
    await tester.pumpAndSettle(Duration(seconds: 1));
    expect(find.byIcon(Icons.favorite), findsNothing);
  }); */
}
