// ignore_for_file: avoid_print, prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ctrlweb/fadeanimation.dart';
import 'package:ctrlweb/firebase_options.dart';
import 'package:ctrlweb/keyboard..dart';
import 'package:ctrlweb/login.dart';
import 'package:ctrlweb/screens/auth.page.dart';
import 'package:ctrlweb/states/boiler.dart';
import 'package:ctrlweb/utilities/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  // print('Platform : ${DefaultFirebaseOptions.currentPlatform}');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MainState(),
        ),
      ],
      child:
          // KeyBoard(),
          const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // FirebaseFirestore db = FirebaseFirestore.instance;

  // try {
  //   final userCredential = await FirebaseAuth.instance.signInAnonymously();
  //   print("Signed in with temporary account. $userCredential");
  // } on FirebaseAuthException catch (e) {
  //   switch (e.code) {
  //     case "operation-not-allowed":
  //       print("Anonymous auth hasn't been enabled for this project.");
  //       break;
  //     default:
  //       print("Unknown error.");
  //   }
  // }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final mainState = Provider.of<MainState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            // print(snapshot.data);
            // print(snapshot.connectionState);

            User? user = snapshot.data;
            // var height = MediaQuery.of(context).size.height;
            // var width = MediaQuery.of(context).size.width;
            final GlobalKey<ScaffoldState> _scaffoldKey =
                GlobalKey<ScaffoldState>();
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                if (user == null) {
                  return ResponsiveWidget.isSmallScreen(context)
                      ? AuthPage()
                      : ResponsiveWidget.isMediumScreen(context)
                          ? AuthPage()
                          : Scaffold(
                              body: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          colors: [
                                            Colors.black,
                                            Colors.purple,
                                          ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: Center(
                                          child:
                                              // Container(
                                              //     decoration: BoxDecoration(
                                              //         borderRadius: BorderRadius.all(
                                              //             Radius.circular(30)),
                                              //         color: Colors.white),
                                              //     child:
                                              AspectRatio(
                                            aspectRatio: 16 / 10,
                                            child:
                                                // RealAdsPlayer(
                                                //     mainState.controller1,
                                                //     mainState),
                                                // child:
                                                Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://cdn.pixabay.com/photo/2013/06/29/19/52/mountains-142158_960_720.jpg",
                                                  // "https://c4.wallpaperflare.com/wallpaper/560/771/577/pixel-cat-fantasy-art-digital-art-swamp-forest-hd-wallpaper-preview.jpg",
                                                  // "https://www.i-sight.com/wp-content/uploads/2021/05/How-to-Authenticate-Online-Evidence.png",
                                                  // "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/ugjh1p6bhqu8yeskaqst",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              downloadProgress) =>
                                                          Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                  fit: BoxFit.fill,
                                                ),
                                                //     Image.network(
                                                //   "https://cdn.pixabay.com/photo/2013/06/29/19/52/mountains-142158_960_720.jpg",
                                                //   fit: BoxFit.fill,
                                                // ),
                                              ),
                                            ),
                                          ), // Text('Hello'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: AuthPage(),
                                  )
                                ],
                              ),
                            );
                }
                return Consumer<MainState>(
                  builder: (context, state, _) {
                    // print(state);
                    return Container(
                      color: Color.fromRGBO(244, 67, 54, 1),
                      child:
                          // null,
                          Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              color: Colors.blueGrey,
                              onPressed: () {
                                print(state.current!.uid);
                                state.writeFire(uid: state.current!.uid);
                              },
                              child: Text('Write'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  color: Colors.blueGrey,
                                  onPressed: () {
                                    print(state.current!.uid);
                                    state.readFire(uid: state.current!.uid);
                                  },
                                  child: Text('Read'),
                                ),
                                // state.name!.isEmpty
                                //     ?
                                //     Text('Name')
                                //     :
                                Text(state.name!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              // RootPage(
              //   scaffoldKey: _scaffoldKey,
              //   height: height,
              //   width: width,
              // );
              // case ConnectionState.none:
              //   print('None');
              //   return const Scaffold(
              //     body: CircularProgressIndicator(),
              //   );
              // case ConnectionState.waiting:
              //   print('Waiting');
              //   return const Scaffold(
              //     body: CircularProgressIndicator(),
              //   );

              // case ConnectionState.done:
              //   print('Done');
              //   return const Scaffold(
              //     body: CircularProgressIndicator(),
              //   );
              default:
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
            }
            // return Container();
          },
        ),
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.height,
    required this.width,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final double height;
  final double width;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final searchController = TextEditingController();
  String searchText = 'Scan UPC Code';

  late FocusNode focusSearch;

  @override
  void initState() {
    // TODO: implement initState
    focusSearch = FocusNode();
    focusSearch.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainState>(
      builder: ((context, mainState, child) => Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.blueGrey,
            //   actions: [
            //     MaterialButton(
            //       child: const Text('Sign Out'),
            //       onPressed: () {
            //         FirebaseAuth.instance.signOut();
            //       },
            //     ),
            //   ],
            // ),
            drawer: Drawer(),
            key: widget._scaffoldKey,
            body: SafeArea(
              child: Container(
                height: widget.height,
                width: widget.width,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    AppBarCustom(scaffoldKey: widget._scaffoldKey),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Container(
                    //   height: kToolbarHeight,
                    //   width: width,
                    //   color: Colors.black,
                    // ),
                    // Expanded(
                    //   child:
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            // color: Colors.white,
                            child: Center(
                              child: TextField(
                                enabled: true,
                                autofocus: true,
                                autocorrect: false,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text,
                                focusNode: focusSearch,
                                controller: searchController,
                                onSubmitted: (value) {
                                  setState(() {
                                    searchText = value;
                                  });

                                  // print(mainState.customerInterface);
                                  if (value == mainState.customerInterface) {
                                    mainState.changeInterface(state: true);
                                  } else {
                                    mainState.changeInterface(state: false);
                                  }
                                  print(value);
                                  searchController.clear();
                                  focusSearch.requestFocus();
                                },
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                onChanged: (text) {
                                  // mainState.authorizeAuthFields(text);
                                },
                                // obscureText: true,
                                decoration:
                                    TextFormFieldDeco('Repeat Password'),
                              ),
                              // Text(
                              //   'Home',
                              //   style: TextStyle(
                              //     fontSize: 80,
                              //   ),
                              // ),
                            ),
                          ),
                          // ),
                        ),
                        Text(
                          searchText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        mainState.change2Receipt
                            ? Container(
                                child: Center(
                                  child: Text('Customer Area'),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 2.5, 0),
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.purple,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Icon(
                                            Icons.image,
                                            size: 100,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5.2, 0, 5, 0),
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Name: Tonic Water'),
                                                Text('Quantity: 500ml'),
                                                Text('Price: 70 KES'),
                                                Row(
                                                  children: [
                                                    Text('Name:'),
                                                    Text('Name:'),
                                                    Text('Name:'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

InputDecoration TextFormFieldDeco(labelText) {
  return InputDecoration(
    hintStyle: const TextStyle(
      color: Colors.white,
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
    ),
    helperStyle: const TextStyle(
      color: Colors.white,
    ),
    errorStyle: const TextStyle(
      color: Colors.white,
    ),
    // contentPadding: const EdgeInsets.all(8.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        color: Colors.green,
        width: 2.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    ),
    // labelText: labelText,
  );
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveWidget.isLargeScreen(context)
            ? CompanyTitle()
            : Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 25,
                    child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        iconSize: 30,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(1000),
                        // ),
                        icon: Icon(Icons.menu)),
                  ),
                  CompanyTitle()
                ],
              ),
        Row(
          children: [
            Container(
              height: 40,
              // width: 40,
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sign Out',
                      style: TextStyle(
                          // color: Colors.white,
                          // fontSize: 20,
                          ),
                    ),
                  ],
                ),
                // child: Text(
                //   'Sign Out',
                //   style: TextStyle(color: Colors.white, fontSize: 20),
                // ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}

class CompanyTitle extends StatelessWidget {
  const CompanyTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(
          width: 10,
        ),
        Text(
          'BrainsChild',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// class Menu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               _menuItem(title: 'Home'),
//               _menuItem(title: 'About us'),
//               _menuItem(title: 'Contact us'),
//               _menuItem(title: 'Help'),
//             ],
//           ),
//           Row(
//             children: [
//               _menuItem(title: 'Sign In', isActive: true),
//               _registerButton()
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _menuItem({String title = 'Title Menu', isActive = false}) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 75),
//     child: MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: Column(
//         children: [
//           Text(
//             '$title',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: isActive ? Colors.deepPurple : Colors.grey,
//             ),
//           ),
//           const SizedBox(
//             height: 6,
//           ),
//           isActive
//               ? Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 )
//               : const SizedBox()
//         ],
//       ),
//     ),
//   );
// }

// Widget _registerButton() {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15),
//       boxShadow: [
//         const BoxShadow(
//           // color: Colors.grey[200],
//           spreadRadius: 10,
//           blurRadius: 12,
//         ),
//       ],
//     ),
//     child: const Text(
//       'Register',
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         color: Colors.black54,
//       ),
//     ),
//   );
// }

// class RealAdsPlayer extends StatelessWidget {
//   final VideoPlayerController player;
//   final MainState mainState;
//   const RealAdsPlayer(this.player, this.mainState, {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final player = Provider.of(context);
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     // return Scaffold(
//     //   appBar: AppBar(
//     //       // title:
//     //       //     Text("Test Video", style: Theme.of(context).textTheme.headline2),
//     //       ),
//     //   body:
// //        controller1.value.isInitialized?
//     //   Container(
//     // width: width / 2,
//     // height: height / 2,
//     // padding: const EdgeInsets.all(20),
//     // child:
//     return Container(
//       // margin: const EdgeInsets.all(20),
//       // color: Colors.red,
//       height: height / 1.5,
//       width: width / 2,
//       child:
//           // AspectRatio(
//           //     aspectRatio: 4 / 3,
//           //     // player.value.aspectRatio,
//           //     child:
//           !player.value.isInitialized
//               ? Container(
//                   // color: Colors.black,
//                   // shape: RoundedRectangleBorder(
//                   //   borderRadius: BorderRadius.circular(30),
//                   // ),
//                   // elevation: 50,
//                   // shadowColor: Colors.white,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(0),
//                       topRight: Radius.circular(30),
//                       bottomLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30),
//                     ),
//                     // (Radius.circular(30)),
//                     gradient: LinearGradient(
//                       begin: Alignment.centerRight,
//                       end: Alignment.centerLeft,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       colors: [
//                         Colors.purple,
//                         Colors.black,
//                       ],
//                     ),
//                   ),
//                   // decoration: const BoxDecoration(
//                   //     color: Colors.black,
//                   //     borderRadius: BorderRadius.all(Radius.circular(30))),
//                   // height: height / 3,
//                   child:
//                       // VideoPlayer(player),
//                       Stack(
//                     children: [
//                       VideoPlayer(player),
//                       Positioned(
//                         // alignment: Alignment.topLeft,
//                         top: -5,
//                         left: 0,
//                         child: Row(
//                           children: [
//                             // IconButton(
//                             //   onPressed: () {
//                             //     // mainState.play();
//                             //   },
//                             //   icon: Icon(
//                             //     Icons.play_arrow,
//                             //     color: Colors.white,
//                             //     size: 25,
//                             //   ),
//                             // ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.volume_off_sharp,
//                                 color: Colors.white,
//                                 size: 25,
//                               ),
//                             ),
//                             Icon(
//                               Icons.volume_off_sharp,
//                               color: Colors.white,
//                               size: 25,
//                             ),
//                             // Icon(
//                             //   Icons.volume_off_sharp,
//                             //   color: Colors.white,
//                             //   size: 25,
//                             // ),
//                           ],
//                         ),
//                       )
//                       // Column(
//                       //   children: [
//                       //     Text(player.dataSource),
//                       //     Text(player.value.duration.toString()),
//                       //     Text(player.textureId.toString()),
//                       //     // Text(player.dataSource),
//                       //     // Text(player.dataSource),
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 )
//               : const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//       // ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign In to \nMy Application',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "If you don't have an account",
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "You can",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      print(MediaQuery.of(context).size.width);
                    },
                    child: const Text(
                      "Register here!",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'images/illustration-2.png',
                width: 300,
              ),
            ],
          ),
        ),

        Image.asset(
          'images/illustration-1.png',
          width: 300,
        ),
        // MediaQuery.of(context).size.width >= 1300 //Responsive
        //     ? Image.asset(
        //         'images/illustration-1.png',
        //         width: 300,
        //       )
        //     : SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: Container(
            width: 320,
            child: _formLogin(),
          ),
        )
      ],
    );
  }

  Widget _formLogin() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter email or Phone number',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Colors.blueGrey[50],
                  ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Colors.blueGrey[50],
                  ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            counterText: 'Forgot password?',
            suffixIcon: const Icon(
              Icons.visibility_off_outlined,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Colors.blueGrey[50],
                  ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  // color: Colors.blueGrey[50],
                  ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              const BoxShadow(
                // color: Colors.deepPurple[100],
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => print("it's pressed"),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Container(
                width: double.infinity,
                height: 50,
                child: const Center(child: const Text("Sign In"))),
          ),
        ),
        const SizedBox(height: 40),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 50,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const Text("Or continue with"),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
        ]),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _loginWithButton(image: 'images/google.png'),
            _loginWithButton(image: 'images/github.png', isActive: true),
            _loginWithButton(image: 'images/facebook.png'),
          ],
        ),
      ],
    );
  }

  Widget _loginWithButton({String? image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
                  // color: Colors.grey[300],
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  // color: Colors.grey[400],
                  ),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  const BoxShadow(
                    // color: Colors.grey[400],
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : const BoxDecoration(),
        child: Image.asset(
          '$image',
          width: 35,
        ),
      )),
    );
  }
}
