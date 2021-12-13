// Source
// Inspiration for login funktionality:
  // https://www.youtube.com/watch?v=PweQbVgR9iI
  // https://support.appmachine.com/hc/en-us/articles/203645706-Create-a-Facebook-App-ID-App-Secret
  // https://blog.logrocket.com/implementing-firebase-authentication-in-a-flutter-app/
  // https://github.com/sbis04/flutter-authentication
  // https://medium.com/firebase-tips-tricks/how-to-use-google-sign-in-with-firebase-in-flutter-bfc4d0e463e7

class Validator {
  static String? validateName({required String name}) {
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return 'Brugernavn må ikke være tomt';
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Du skal angive din e-mail';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Du skal angive en korrekt e-mail';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return 'Du skal angive dit kodeord';
    } else if (password.length < 6) {
      return 'Indtast et kodeord med en længde på mindst 6';
    }

    return null;
  }
}