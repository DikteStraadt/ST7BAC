import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_1_0/pages/email_login_page.dart';
import 'package:flutter_project_1_0/pages/login_page.dart';
import 'package:flutter_project_1_0/pages/activities_page.dart';
import 'package:flutter_project_1_0/pages/favorites_page.dart';
import 'package:flutter_project_1_0/pages/forums_page.dart';
import 'package:flutter_project_1_0/pages/home_page.dart';
import 'package:flutter_project_1_0/pages/new_forum_page.dart';
import 'package:flutter_project_1_0/pages/new_plan_page.dart';
import 'package:flutter_project_1_0/pages/plans_page.dart';
import 'package:flutter_project_1_0/pages/registre_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hånd i hånd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: Color(0xfffefe1c8),
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue[900])),
      home: LoginPage(),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'emaillogin': (context) => EmailLoginPage(),
        'registre': (context) => RegisterPage(),
        'home': (context) => HomePage(),
        'favorites': (context) => FavoritesPage(),
        'plans': (context) => PlanPage(),
        'newplan': (context) => NewPlanPage(),
        'forums': (context) => ForumsPage(),
        'newforum': (context) => NewForumPage(),
        'activities': (context) => ActivitiesPage(),
      },
    );
  }
}
