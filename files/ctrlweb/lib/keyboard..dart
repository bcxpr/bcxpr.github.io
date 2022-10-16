// import 'package:flutter/material.dart';
// import 'package:keyboard_manager/keyboard_manager.dart';

// class KeyBoard extends StatefulWidget {
//   @override
//   _KeyBoardState createState() => _KeyBoardState();
// }

// class _KeyBoardState extends State<KeyBoard> {
//   late Keyboard _keyboard;

//   @override
//   void initState() {
//     _keyboard = new Keyboard(left: () {
//       print("left key pressed");
//     }, right: () {
//       print("right key pressed");
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: KeyboardManager(
//         keyboard: _keyboard,
//         autofocus: true,
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Keyboard manager example'),
//           ),
//           body: Center(
//             child: Text('I am listening to keyboard events'),
//           ),
//         ),
//       ),
//     );
//   }
// }
