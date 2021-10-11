import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/testPage.dart';
import 'screens/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lidt-en-Valdemarsro-app',
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      home: MyHomePage(),
    );
  }
}
