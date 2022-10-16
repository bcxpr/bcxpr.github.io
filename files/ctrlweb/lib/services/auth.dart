import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///
  /// return the Future with firebase user object FirebaseUser if one exists
  ///
  User getUser() {
    return _auth.currentUser!;
  }

  // wrapping the firebase calls
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  signIn(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,
              // "barry.allen@example.com",
              password: password);
      print(userCredential);
      // "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      // print(e);
      print(e.message);
      print(e.code);
      // print(e.credential);
      // print(e.tenantId);
      // print(e.stackTrace);
      // print(e.email);
      // print(e.phoneNumber);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e;
    } catch (e) {
      print(e);
    }
  }

  signUp(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email,
              // "barry.allen@example.com",
              password: password);
      print(userCredential);
      // "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      print(e);
      print(e.message);
      print(e.plugin);
      print(e.credential);
      print(e.tenantId);
      print(e.stackTrace);
      print(e.email);
      print(e.phoneNumber);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e;
    } catch (e) {
      print(e);
    }
  }
}

  ///
  /// wrapping the firebase call to signInWithEmailAndPassword
  /// `email` String
  /// `password` String
  ///
  // Future loginUser(email, password) async {
  //   try {
  //     var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     // since something changed, let's notify the listeners...
  //     notifyListeners();
  //     return result;
  //   } catch (e) {
  //     print(e.);
  //     return e;

      // throw the Firebase AuthException that we caught
      // throw new AuthException(e.code, e.message);
//     }
//   }
// }
