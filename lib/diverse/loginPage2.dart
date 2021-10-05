import 'package:flutter/material.dart';
import 'package:flutter_project_1_0/screens/planPage.dart';
import 'package:flutter_project_1_0/models/loginData.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();

    String emailValue = "123";
    String passwordValue = "345";

    controllerEmail.addListener(() {
      emailValue = controllerEmail.text;
    });

    controllerPassword.addListener(() {
      passwordValue = controllerPassword.text;
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('Lidt-en-Valdemarsro-app'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: controllerEmail,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: controllerPassword,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlanPage(
                                data: LoginData(emailValue, passwordValue),
                              )), //HomePage()
                    );
                  },
                  child: new Text("Log in"))
            ])));
  }
}
