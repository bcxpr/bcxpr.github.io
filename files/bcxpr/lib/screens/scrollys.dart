import 'dart:ui';

import 'package:bcxpr_home/main.dart';
import 'package:bcxpr_home/widgets/explore_drawer.dart';
import 'package:bcxpr_home/widgets/responsive.dart';
import 'package:bcxpr_home/widgets/top_bar_contents.dart';
import 'package:bcxpr_home/widgets/web_scrollbar.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class Scrolly extends StatefulWidget {
  Scrolly({Key? key}) : super(key: key);

  @override
  State<Scrolly> createState() => _ScrollyState();
}

class _ScrollyState extends State<Scrolly> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  final List _items = List.generate(100, (index) {
    return "Item $index";
  });

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  double aniheight = kToolbarHeight;
  double aniwidth = 0;

  // print('');
  @override
  Widget build(BuildContext context) {
    const int myAppsCount = 12;
    final List<Map> myAppsTitles = [
      {
        'name': "Control Web",
        'desc': "Application for controlling the web",
        'url': 'https://bcxpr.github.io/apps/ctrlweb/#!',
      },
      {
        'name': "WSS Protocol",
        'desc': "WS implementation for flutter Web",
        'url': 'https://bcxpr.github.io/apps/wssprtcl/#!',
      },
      {
        'name': "Bemca POS",
        'desc': "Custom built POS System",
        'url': 'https://bcxpr.github.io/apps/bemcapos/#!',
      },
      {
        'name': "BCXPR STORE",
        'desc': "BCXPR STORE",
        'url': 'https://bcxpr.github.io/apps/brainschild/#!',
      },
      {
        'name': "Basics",
        'desc': "Basics",
        'url': 'https://bcxpr.github.io/apps/basics/#!',
      },
      {
        'name': "Explore",
        'desc': "Main Site Theme",
        'url': 'https://bcxpr.github.io/apps/explore/#!',
      },
      {
        'name': "Control Web",
        'desc': "Application for controlling the web",
        'url': 'https://bcxpr.github.io/apps/ctrlweb/#!',
      },
      {
        'name': "WSS Protocol",
        'desc': "WS implementation for flutter Web",
        'url': 'https://bcxpr.github.io/apps/wssprtcl/#!',
      },
      {
        'name': "Bemca POS",
        'desc': "Custom built POS System",
        'url': 'https://bcxpr.github.io/apps/bemcapos/#!',
      },
      {
        'name': "BCXPR STORE",
        'desc': "BCXPR STORE",
        'url': 'https://bcxpr.github.io/apps/brainschild/#!',
      },
      {
        'name': "Basics",
        'desc': "Basics",
        'url': 'https://bcxpr.github.io/apps/basics/#!',
      },
      {
        'name': "Explore",
        'desc': "Main Site Theme",
        'url': 'https://bcxpr.github.io/apps/explore/#!',
      },
    ];

    final List<Map> myApps = List.generate(
        myAppsCount,
        (index) => {
              "id": index,
              "url": myAppsTitles[index]["url"],
              "title": myAppsTitles[index]["name"],
              "subtitle": myAppsTitles[index]["desc"],
              "asset": "assets/images/${index}.jpg",
            }).toList();

    final size = MediaQuery.of(context).size;

    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    List<String> images = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
      "https://wallpaperaccess.com/full/2637581.jpg"
    ];

    // Widget _buildColumn() {
    //   var stringList = ["a", "b", "c"];

    //   // Create a List<Text> (or List<MyWidget>) using each String from stringList
    //   var textList = myApps
    //       .map<Image>((s) => Image.asset(s["asset"])
    //           // Text(s["asset"]),
    //           )
    //       .toList();

    //   // use that list however you want!
    //   return
    //       // textList;
    //       Column(children: textList);
    // }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Kindacode.com'),
      // ),
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                // IconButton(
                //   icon: Icon(Icons.brightness_6),
                //   splashColor: Colors.transparent,
                //   highlightColor: Colors.transparent,
                //   onPressed: () {
                //     EasyDynamicTheme.of(context).changeTheme();
                //   },
                // ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      aniheight = kToolbarHeight;
                    });
                  },
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
                        // color: Colors.black.withOpacity(0.4),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
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
                // aniheight == 0
                // ?
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOutCirc,
                  padding: EdgeInsets.zero,
                  width: aniwidth,
                  height: aniwidth,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                      // topRight: Radius.circular(10),
                      // bottomRight: Radius.circular(10),
                    ),
                    // color: Colors.blue[100],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print('close pressed');
                      setState(() {
                        aniheight = kToolbarHeight;
                        aniwidth = 0;
                      });
                    },
                    child: aniwidth == 40
                        ? const Icon(
                            Icons.chat,
                            color: Colors.blue,
                            size: 18,
                          )
                        : Container(),
                  ),
                )
                // : Container(),
              ],
              title: Text(
                'brainschild',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: const ExploreDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutCirc,
              height: aniheight / 2,
              width: double.infinity,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   children: [
                  //     aniheight != 0
                  //         ? Center(
                  //             child: InkWell(
                  //               onTap: () {
                  //                 print('close pressed');
                  //                 setState(() {
                  //                   aniheight = 0;
                  //                 });
                  //               },
                  //               child: Container(
                  //                 width: aniheight / 1.5,
                  //                 height: aniheight / 2,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: const BorderRadius.only(
                  //                     topRight: Radius.circular(10),
                  //                     bottomRight: Radius.circular(10),
                  //                   ),
                  //                   color: Colors.blue[100],
                  //                 ),
                  //                 child: const Icon(
                  //                   Icons.chat,
                  //                   color: Colors.blue,
                  //                   size: 18,
                  //                 ),
                  //               ),
                  //             ),
                  //           )
                  //         : Container(),
                  //   ],
                  // ),
                  Expanded(
                    // flex: 30,
                    child: Center(
                      child: Text(
                        'Free Delivery for goods about 4000/= KES',
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            print('close pressed');
                            setState(() {
                              aniheight = 0;
                              aniwidth = 40;
                            });
                          },
                          child: Container(
                            width: aniheight / 1.5,
                            height: aniheight / 2,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                              color: Colors.red[100],
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // CustomAppBar(size: size),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  // SliverToBoxAdapter(
                  //   child: Container(
                  //     height: 50.0,
                  //     width: double.infinity,
                  //     color: Colors.yellow,
                  //   ),
                  // ),
                  // const SliverPadding(
                  //   padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  //   // sliver: PageView.builder(
                  //   //   itemCount: 2,
                  //   //   pageSnapping: true,
                  //   //   itemBuilder: (context, pagePosition) {
                  //   //     return Container(
                  //   //       margin: EdgeInsets.all(10),
                  //   //       child: Image.network(
                  //   //         images[pagePosition],
                  //   //       ),
                  //   //     );
                  //   //   },
                  //   // ),
                  // ),
                  // SliverList(
                  //   delegate: SliverChildListDelegate(
                  //     [
                  //       PageView.builder(
                  //         itemCount: 2,
                  //         pageSnapping: true,
                  //         itemBuilder: (context, pagePosition) {
                  //           return Container(
                  //             margin: EdgeInsets.all(10),
                  //             child: Image.network(
                  //               images[pagePosition],
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //       // Directionality(
                  //       //   textDirection: TextDirection.ltr,
                  //       //   child: SizedBox(
                  //       //     width: size.width,
                  //       //     height: size.height,
                  //       //     child: const HtmlElementView(
                  //       //         viewType: 'hello-world-html'),
                  //       //   ),
                  //       // )

                  //       // BodyWidget(Colors.green, size),
                  //       // BodyWidget(Colors.orange, size),
                  //       // BodyWidget(Colors.blue, size),
                  //       // BodyWidget(Colors.red, size),
                  //     ],
                  //   ),
                  // ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      // gridDelegate:
                      //     const SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 2,
                      //         childAspectRatio: 1.0,
                      //         mainAxisSpacing: 10.0,
                      //         crossAxisSpacing: 10.0),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return
                              // Container(
                              //   color: Colors.red,
                              // );
                              InkWell(
                            onTap: () {
                              html.window
                                  .open('${myApps[index]["url"]}', 'new tab');
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(myApps[index]["asset"]),
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
                                    height: 100,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            myApps[index]["title"],
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            myApps[index]["subtitle"],
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: myAppsCount,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        BodyWidget(
                            Theme.of(context)
                                .bottomAppBarColor
                                .withOpacity(_opacity),
                            size),
                        BodyWidget(Colors.black, size),
                        // Directionality(
                        //   textDirection: TextDirection.ltr,
                        //   child: SizedBox(
                        //     width: size.width,
                        //     height: size.height,
                        //     child: const HtmlElementView(
                        //         viewType: 'hello-world-html'),
                        //   ),
                        // )

                        // BodyWidget(Colors.green, size),
                        // BodyWidget(Colors.orange, size),
                        // BodyWidget(Colors.blue, size),
                        // BodyWidget(Colors.red, size),
                      ],
                    ),
                  ),
                  // const SliverPadding(
                  //   padding: EdgeInsets.only(bottom: 80.0),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
      // Column(
      //   children: [
      //     CustomAppBar(size: size),
      //     SingleChildScrollView(
      //       child: Flexible(
      //         child: Padding(
      //           padding: const EdgeInsets.all(10.0),
      //           child: GridView.builder(
      //             shrinkWrap: true,
      //             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //               maxCrossAxisExtent: 400,
      //               childAspectRatio: 3 / 2,
      //               crossAxisSpacing: 10,
      //               mainAxisSpacing: 10,
      //             ),
      //             itemCount: myApps.length,
      //             itemBuilder: (BuildContext ctx, index) {
      //               return
      //                   // Container(
      //                   //     alignment: Alignment.center,
      //                   //     decoration: BoxDecoration(
      //                   //       color: Colors.amber[50],
      //                   //       borderRadius: BorderRadius.circular(15),
      //                   //     ),
      //                   //     child:
      //                   Stack(
      //                 children: [
      //                   ClipRRect(
      //                     borderRadius: BorderRadius.circular(15),
      //                     child: Image.asset(myApps[index]["asset"]),
      //                   ),
      //                   Align(
      //                     alignment: Alignment.bottomLeft,
      //                     child: Container(
      //                       decoration: BoxDecoration(
      //                         gradient: const LinearGradient(
      //                           begin: Alignment.topCenter,
      //                           end: Alignment.bottomCenter,
      //                           colors: [
      //                             Colors.transparent,
      //                             Colors.black,
      //                           ],
      //                         ),
      //                         borderRadius: BorderRadius.circular(15),
      //                       ),
      //                       //  Colors.black.withOpacity(0.5),
      //                       height: 80,
      //                       width: double.infinity,
      //                       child: Padding(
      //                         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               myApps[index]["title"],
      //                               style: TextStyle(
      //                                 color: Colors.white.withOpacity(0.5),
      //                               ),
      //                             ),
      //                             Text(
      //                               myApps[index]["subtitle"],
      //                               style: TextStyle(
      //                                 color: Colors.white.withOpacity(0.5),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //                 // )
      //               );
      //             },
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String text;

  const HeaderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(text),
      color: Colors.grey[200],
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Color color;
  final Size size;

  BodyWidget(this.color, this.size, {super.key});

  // const BodyWidget({Key? key, required this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height - kToolbarHeight,
      color: color,
      alignment: Alignment.center,
    );
  }
}
