import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_project_1_0/pages/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loading = false;

  void _logInWithFacebook() async {
    setState(() {
      loading = true;
    });

    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'Denne konto eksisterer hos en anden login-udbyder';
          break;
        case 'invalid-credential':
          content = 'Der er opstået en ukendt fejl';
          break;
        case 'operation-not-allowed':
          content = 'Denne handling er ikke tilladt';
          break;
        case 'user-disabled':
          content = 'Den bruger, du forsøgte at logge på, er deaktiveret';
          break;
        case 'user-not-found':
          content = 'Den bruger, du forsøgte at logge på, blev ikke fundet';
          break;
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Log ind med Facebook mislykkedes'),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'))
                ],
              ));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void _logInWithGoogle() async {
    setState(
      () {
        loading = true;
      },
    );

    try {
      final GoogleSignInAccount? googleLoginResult =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleLoginResult!.authentication;
      final googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(googleAuthCredential);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'Denne konto eksisterer hos en anden login-udbyder';
          break;
        case 'invalid-credential':
          content = 'Der er opstået en ukendt fejl';
          break;
        case 'operation-not-allowed':
          content = 'Denne handling er ikke tilladt';
          break;
        case 'user-disabled':
          content = 'Den bruger, du forsøgte at logge på, er deaktiveret';
          break;
        case 'user-not-found':
          content = 'Den bruger, du forsøgte at logge på, blev ikke fundet';
          break;
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Log ind med Google mislykkedes'),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'))
                ],
              ));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hånd i hånd'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hånd i hånd',
                style: TextStyle(
                    fontFamily: 'Margarine',
                    fontSize: MediaQuery.of(context).size.width * 0.13),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Image(
                  image: AssetImage('lib/assets/launcher/logo.png'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              if (loading) ...[
                const SizedBox(height: 15),
                const Center(child: const CircularProgressIndicator()),
              ],
              if (!loading) ...[
                SignInButtonBuilder(
                  text: 'Log ind med E-mail',
                  icon: Icons.email,
                  onPressed: () {
                    Navigator.pushNamed(context, 'emaillogin');
                  },
                  backgroundColor: Colors.blueGrey[700]!,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                SignInButtonBuilder(
                  text: 'Log ind med Facebook',
                  icon: Icons.facebook,
                  onPressed: () {
                    _logInWithFacebook();
                  },
                  backgroundColor: Colors.blue[900]!,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                SignInButtonBuilder(
                  text: 'Log ind med Google',
                  image: Image.asset('lib/assets/authentication/google.png',
                      width: MediaQuery.of(context).size.width * 0.06),
                  icon: Icons.facebook,
                  onPressed: () {
                    _logInWithGoogle();
                  },
                  backgroundColor: Colors.red[900]!,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
