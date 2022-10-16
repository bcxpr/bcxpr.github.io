import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MainState with ChangeNotifier {
  bool _defaultAuthPage = true;
  bool get defaultAuthPage => _defaultAuthPage;

  MainState() {
    startFire();
    // initVideos();
  }

  // start() {
  //   print('start');
  // }
  bool _change2Receipt = false;
  bool get change2Receipt => _change2Receipt;
  final String _customerInterface = '50112265';
  String get customerInterface => _customerInterface;

  changeInterface({state}) {
    print(state);
    if (state == true) {
      _change2Receipt = true;
    }
    if (state == false) {
      _change2Receipt = false;
    }
    notifyListeners();
  }

  User? current;
  String? name = '';
  // User

  startFire() {
    // bool isLoggedIn = false;
    print('Starting Fire');
    // startAuth();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print('Logged In');
        print(user.uid);
        current = user;
        // writeFire(user.uid);
      } else {
        print('Not Logged In');
      }
    });

    // readFire(db);
    // if (isLoggedIn) {
    //   // writeFire(db);

    // } else {
    //   logIn() {}
    // }
    notifyListeners();
  }

  switch2Register() {
    _defaultAuthPage = false;
    erase();
    notifyListeners();
  }

  switch2Login() {
    _defaultAuthPage = true;
    erase();
    notifyListeners();
  }

  writeFire({uid}) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    print('Writing Fire');

    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "fname": "James",
      "sname": "Cameron",
      "uid": uid,
      "params": {
        "act1": 1,
        "act2": 0,
        "act3": 1,
      },
      "phone": 7123456789,
      "email": 'shungoh.martin@gmail.com',
      "national": 12345678,
    };

    try {
      db.collection('webUsers').doc(uid).set(user);
    } catch (e) {
      print(e);
    }
    // .then((value) => print('Hello $value'));

    // db.collection("users").
    //  db.collection("users").add(user).then((DocumentReference doc) =>
    // print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  readFire({uid}) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    print('Reading Fire');
    await db.collection("webUsers").get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        if (uid == doc.id) {
          print('Found Him');
          print('Name : ${doc.data()["fname"]} ${doc.data()["sname"]}');
          name = '${doc.data()["fname"]} ${doc.data()["sname"]}';
        } else {
          print('Not Him');
          writeFire(uid: current!.uid
              // FirebaseAuth.instance.currentUser?.uid
              );
        }
      }
    });
    notifyListeners();
  }

  startAuth() async {
    String email = 'admin2@ibring.com';
    String password = '123456Admin';
    if (FirebaseAuth.instance.currentUser != null) {
      print('Current User : ${FirebaseAuth.instance.currentUser?.uid}');
      readFire(uid: FirebaseAuth.instance.currentUser?.uid);
    } else {
      // try {
      //   final credential =
      //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: email,
      //     password: password,
      //   );
      //   print(credential);
      //   readFire(credential.user!.uid);
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'weak-password') {
      //     print('The password provided is too weak.');
      //   } else if (e.code == 'email-already-in-use') {
      //     print('The account already exists for that email.');
      //   }
      // } catch (e) {
      //   print(e);
      // }
      try {
        final userCredential = await FirebaseAuth.instance.signInAnonymously();
        print("Signed in with temporary account. $userCredential");
        // readFire(userCredential.user!.uid);
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "operation-not-allowed":
            print("Anonymous auth hasn't been enabled for this project.");
            break;
          default:
            print("Unknown error.");
        }
      }
    }
  }

  String _email = '';
  String get email => _email;
  String _password = '';
  String get password => _password;
  final String _rptpassword = '';
  String get rptpassword => _rptpassword;

  bool _authRpt = false;
  bool get authRpt => _authRpt;

  bool _misMatch = false;
  bool get misMatch => _misMatch;

  bool _authError = false;
  bool get authError => _authError;

  final passwordField = TextEditingController();
  final emailField = TextEditingController();

  void emailText(String text) {
    _email = text;
    notifyListeners();
  }

  void passwordText(String text) {
    _password = text;
    notifyListeners();
  }

  void errorHandler(bool state) {
    _authError = state;
    notifyListeners();
  }

  void erase() {
    _password = '';
    _email = '';
    passwordField.clear();
    emailField.clear();
    errorHandler(false);
    notifyListeners();
  }

  void authorizeAuthFields(String text) {
    _misMatch = true;
    if (text == password) {
      _authRpt = true;
    } else {
      _authRpt = false;
    }
    notifyListeners();
  }

  late final VideoPlayerController _controller1;
  VideoPlayerController get controller1 => _controller1;
  late final Future<void> video1;

  initVideos() {
    print('Init Videos Started');
    _controller1 = VideoPlayerController.asset("assets/video/onepiece1021.mp4");
    // _controller2 = VideoPlayerController.asset("assets/video/spyfamily05.mp4");
    // ..initialize().then((_) {
    //   // controller1.play();
    //   // controller1.setLooping(true);
    //   // setState(() {});
    // });
    controller1.initialize().then((value) {
      print(controller1.value.duration);
      print(controller1.value.buffered);
      print(controller1.value.playbackSpeed);
      // controller1.setPlaybackSpeed(0.25);
      controller1.setVolume(0);
    });
    // controller2.initialize().then((value) => null);
    // video1 = controller1.initialize();
    // video2 = controller2.initialize();
    Timer(const Duration(seconds: 5), () {
      play();
    });
    notifyListeners();
  }

  void play() {
    print('Play Pressed');
    if (!controller1.value.isPlaying) {
      // || !controller2.value.isPlaying) {
      controller1.play();
      // controller2.play();
    }
    notifyListeners();
  }

  void pause() {
    if (controller1.value.isPlaying) {
      controller1.pause();
    }
  }
  // String _displayText = "";

  // void setDisplayText(String text) {
  //   _displayText = text;
  //   notifyListeners();
  // }

  // String get getDisplayText => _displayText;
}
