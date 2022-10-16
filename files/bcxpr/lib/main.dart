import 'dart:html' show IFrameElement;
// import 'package:analog_clock/analog_clock.dart';
// import 'package:bcxpr_home/screens/home_page.dart';
import 'package:bcxpr_home/screens/scrollys.dart';
import 'package:bcxpr_home/utilities/theme_data.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;
// import 'dart:js' as js;

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'hello-world-html',
      (int viewId) => IFrameElement()
        ..width = '640'
        ..height = '360'
        ..src = 'https://bcxpr.github.io/main.html'
        ..style.border = 'none');

  runApp(
    EasyDynamicThemeWidget(
      child: const Frame(),
    ),
  );
}

class Frame extends StatefulWidget {
  const Frame({
    Key? key,
  }) : super(key: key);

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore',
      theme: darkThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: Scaffold(
        backgroundColor: Colors.white,
        // const Color.fromARGB(139, 108, 33, 33),
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   title: MaterialButton(
        //     child: const Text(
        //       'BCXPR',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 25,
        //       ),
        //     ),
        //     onPressed: () {},
        //   ),
        //   actions: [
        //     MaterialButton(
        //       onPressed: () {},
        //       child: const Text(
        //         'Projects',
        //         style: TextStyle(
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //     TextButton(
        //       onPressed: () {},
        //       child: Stack(
        //         children: [
        //           ClipRRect(
        //             borderRadius: BorderRadius.circular(50),
        //             child: Container(
        //               height: 40,
        //               width: 40,
        //               child: Image.network(
        //                 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
        //                 fit: BoxFit.fill,
        //                 // colorBlendMode: BlendMode.colorDodge,
        //                 // color: Colors.white.withOpacity(0.1),
        //               ),
        //             ),
        //           ),
        //           Container(
        //             color: Colors.black.withOpacity(0.4),
        //             height: 40,
        //             width: 40,
        //           ),
        //           Container(
        //             height: 40,
        //             width: 40,
        //             child: Center(
        //               child: Text(
        //                 'MS',
        //                 style: TextStyle(
        //                   color: Colors.white.withOpacity(0.8),
        //                   fontSize: 15,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        //   // centerTitle: true,
        // ),
        body:
            // HomePage()
            // HomeScreen()
            Scrolly(),
        // Scrolly(),
      ),
    );

    // HomeScreen(
    //   size: size,
    // );

    // Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: SizedBox(
    //     width: width,
    //     height: height,
    //     child: const HtmlElementView(viewType: 'hello-world-html'),
    //   ),
    // );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    // required this.size,
    // required this.size,
    // required this.size,
  }) : super(key: key);

  final Size size;

  final List<Map> myProducts = List.generate(
      12,
      (index) => {
            "id": index,
            "title": "Main $index",
            "subtitle": "Sub $index",
            "asset": "images/${index}.jpg",
          }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomAppBar(size: size),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                // color: Colors.amber,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      // color: Colors.red,
                      // height: size.height,
                      // width: size.width,
                      child: CustomGridView(myProducts: myProducts),
                    ),
                    Container(
                      color: Colors.black,
                      height: size.height,
                      width: size.width,
                    ),
                    Container(
                      color: Colors.red,
                      height: size.height,
                      width: size.width,
                    ),
                    Container(
                      color: Colors.green,
                      height: size.height,
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ),
          )
          // Expanded(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          //           child: CustomGridView(myProducts: myProducts),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          //           child: CustomGridView(myProducts: myProducts),
          //         ),
          //         Container(
          //           width: size.width,
          //           height: size.height - kToolbarHeight,
          //           color: Colors.amber,
          //         ),
          //         Container(
          //           width: size.width,
          //           height: size.height - kToolbarHeight,
          //           color: Colors.black,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key? key,
    required this.myProducts,
  }) : super(key: key);

  final List<Map> myProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: myProducts.length,
      itemBuilder: (BuildContext ctx, index) {
        return
            // Container(
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       color: Colors.amber[50],
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child:
            Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(myProducts[index]["asset"]),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                //  Colors.black.withOpacity(0.5),
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myProducts[index]["title"],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        myProducts[index]["subtitle"],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          // )
        );
      },
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: kToolbarHeight,
      color: Colors.black,
      child: Center(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    html.window.open(
                        'https://stackoverflow.com/questions/ask', 'new tab');
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'BCXPR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Projects',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Image.network(
                            'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
                            fit: BoxFit.fill,
                            // colorBlendMode: BlendMode.colorDodge,
                            // color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.4),
                        height: 40,
                        width: 40,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        child: Center(
                          child: Text(
                            'MS',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // AnalogClock(
                //     decoration: BoxDecoration(
                //       border: Border.all(width: 2.0, color: Colors.black),
                //       color: Colors.transparent,
                //       shape: BoxShape.circle,
                //     ),
                //     width: kToolbarHeight,
                //     isLive: true,
                //     hourHandColor: Colors.black,
                //     minuteHandColor: Colors.black,
                //     showSecondHand: true,
                //     numberColor: Colors.black87,
                //     showNumbers: true,
                //     showAllNumbers: true,
                //     textScaleFactor: 1.4,
                //     showTicks: true,
                //     showDigitalClock: true,
                //     datetime: DateTime.now()
                //     //  DateTime(2019, 1, 1, 9, 12, 15),
                //     )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NewColumnWidget extends StatelessWidget {
  const NewColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return HomeScreen(size: size);

//     Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         Container(
// // A fixed-height child.
//           height: 220.0,
//           alignment: Alignment.center,
//           child: Image.network(
//             "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
//           ),
//         ),
//         const SizedBox(
//           height: 5.0,
//         ),
//         Container(
// // A fixed-height child.
//           height: 220.0,
//           alignment: Alignment.center,
//           child: Image.network(
//             "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
//           ),
//         ),
//         const SizedBox(
//           height: 5.0,
//         ),
//         Container(
// // A fixed-height child.
//           height: 220.0,
//           alignment: Alignment.center,
//           child: Image.network(
//             "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
//           ),
//         ),
//         const SizedBox(
//           height: 5.0,
//         ),
//         Container(
// // A fixed-height child.
//           height: 220.0,
//           alignment: Alignment.center,
//           child: Image.network(
//             "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
//           ),
//         ),
//       ],
//     );
  }
}

// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const WebViewX(),
//       // HomeView(),
//     );
//   }
// }

// class WebViewX extends StatelessWidget {
//   const WebViewX({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: const WebView(
//           initialUrl: 'https://flutter.io',
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }

// class HomeView extends StatelessWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: CenteredView(
//         child: Column(
//           children: <Widget>[
//             const NavigationBar(),
//             Expanded(
//               child: Row(
//                 children: [
//                   // CourseDetails(),
//                   CourseDetails(width: width),
//                   const Expanded(
//                     child: Center(
//                       child: CallToAction('Join Course'),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CourseDetails extends StatelessWidget {
//   const CourseDetails({
//     Key? key,
//     required this.width,
//   }) : super(key: key);

//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width / 2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const <Widget>[
//           Text(
//             'FLUTTER WEB.\nTHE BASICS',
//             style: TextStyle(
//               fontWeight: FontWeight.w800,
//               fontSize: 50,
//               height: 0.9,
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Text(
//             'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
//             style: TextStyle(fontSize: 15, height: 1.7),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class NavigationBar extends StatelessWidget {
// //   const NavigationBar({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 100,
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: <Widget>[
// //           // SizedBox(
// //           //   height: 80,
// //           //   width: 150,
// //           //   child: Image.asset('assets/logo.png'),
// //           // ),
// //           const NavBarLogo(),
// //           Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: const <Widget>[
// //               NavBarItem('Episodes'),
// //               SizedBox(
// //                 width: 60,
// //               ),
// //               NavBarItem('About'),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// class NavBarLogo extends StatelessWidget {
//   const NavBarLogo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       width: 150,
//       child: Image.asset('assets/logo.png'),
//     );
//   }
// }

// class NavBarItem extends StatelessWidget {
//   final String title;
//   const NavBarItem(
//     this.title, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       style: const TextStyle(fontSize: 18),
//     );
//   }
// }

// class NavigationBarTabletDesktop extends StatelessWidget {
//   const NavigationBarTabletDesktop({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           const NavBarLogo(),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: const <Widget>[
//               NavBarItem('Episodes'),
//               SizedBox(
//                 width: 60,
//               ),
//               NavBarItem('About'),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class NavigationBarMobile extends StatelessWidget {
//   const NavigationBarMobile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {},
//           ),
//           const NavBarLogo()
//         ],
//       ),
//     );
//   }
// }

// class NavigationBar extends StatelessWidget {
//   const NavigationBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenTypeLayout(
//       mobile: const NavigationBarMobile(),
//       tablet: const NavigationBarTabletDesktop(),
//     );
//   }
// }

// class CenteredView extends StatelessWidget {
//   final Widget? child;
//   const CenteredView({Key? key, this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60),
//       alignment: Alignment.topCenter,
//       child: ConstrainedBox(
//         constraints: const BoxConstraints(maxWidth: 1200),
//         child: child,
//       ),
//     );
//   }
// }

// // class CourseDetails extends StatelessWidget {
// //   const CourseDetails({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       width: 400,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: const <Widget>[
// //           Text(
// //             'FLUTTER WEB.\nTHE BASICS',
// //             style: TextStyle(
// //               fontWeight: FontWeight.w800,
// //               fontSize: 50,
// //               height: 0.9,
// //             ),
// //           ),
// //           SizedBox(
// //             height: 30,
// //           ),
// //           Text(
// //             'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
// //             style: TextStyle(fontSize: 15, height: 1.7),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class CallToAction extends StatelessWidget {
//   final String title;
//   const CallToAction(this.title, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//       decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 31, 229, 146),
//           borderRadius: BorderRadius.circular(15)),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w800,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

// class Scrolly extends StatefulWidget {
//   const Scrolly({super.key});

//   @override
//   State<Scrolly> createState() => _ScrollyState();
// }

// class _ScrollyState extends State<Scrolly> {
//   final List<Map> myProducts = List.generate(
//       12,
//       (index) => {
//             "id": index,
//             "title": "Main $index",
//             "subtitle": "Sub $index",
//             "asset": "images/${index}.jpg",
//           }).toList();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: double.infinity,
//       child: Column(
//         children: [
//           // Expanded used to take up the space
//           Expanded(
//             // ListView.builder, use your carousel here
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: myProducts.length,
//               scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int index) {
//                 // look at this as well, no height, only width
//                 // given for the image
//                 return Container(
//                   width: MediaQuery.of(context).size.width,
//                   // decoration: BoxDecoration(
//                   //     image: DecorationImage(
//                   //         fit: BoxFit.cover,
//                   //         image: Image.asset(myProducts[index]))),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.asset(myProducts[index]["asset"]),
//                   ),
//                 );
//               },
//             ),
//           ),
//           HomePanel()
//         ],
//       ),
//     );
//   }
// }

// class HomePanel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     List<String> data = <String>[
//       "Twitter",
//       "Reddit",
//       "YouTube",
//       "Facebook",
//       "Vimeo",
//       "GitHub",
//       "BitBucket",
//       "LinkedIn",
//       "Medium",
//       "Tumblr",
//       "Instagram",
//       "Pinterest"
//     ];
//     List<ElevatedButton> myWidgets = data.map((item) {
//       return new ElevatedButton(child: new Text(item), onPressed: () async {});
//     }).toList();
//     GridView myGrid = GridView.count(crossAxisCount: 3, children: myWidgets);

//     return Container(
//         height: height / 1.5,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.red,
//         child: myGrid);
//   }
// }
