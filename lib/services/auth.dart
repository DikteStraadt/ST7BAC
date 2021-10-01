import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in anonymos
  Future signInAnon() async {
    
    // try {
    //   AuthResult result await _auth.signInAnonymously();
    //   FirebaseUser user = result.user;
    //   return user;
    // } catch(e){
  }

}
