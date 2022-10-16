import 'package:colour/colour.dart';
import 'package:flutter/material.dart';

class ShopRowOne extends StatelessWidget {
  const ShopRowOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        margin: EdgeInsets.all(5),
        // color: Colors.white,
        child: Column(
          children: [
            Container(
              height: kToolbarHeight - 10,
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              color: Colour('424242'),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        //  BorderRadius.only(
                        //   topRight: Radius.circular(25),
                        //   topLeft: Radius.circular(25),
                        // bottomRight: Radius.circular(25),
                        // ),
                        color: Colour('994444'),
                        // color: _tabColors[_selectedIndex],
                      ),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      // margin: EdgeInsets.fromLTRB(5, 5, 5, 5),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            // flex: 1,
                            child: Icon(
                              Icons.search,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              height: kToolbarHeight,
                              alignment: Alignment.center,
                              // color: Colors.green[300],
                              child: TextFormField(
                                cursorColor: Colors.red,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  // decorating and styling your Text
                                  isCollapsed: true,
                                  contentPadding:
                                      EdgeInsets.only(top: 8, left: 15),
                                ),
                                // decoration: InputDecoration.collapsed(
                                //   hintText: 'Search',
                                // ).copyWith(isDense: true),
                                // decoration: InputDecoration(
                                //   contentPadding: EdgeInsets.zero,
                                // ),
                                // textAlignVertical: TextAlignVertical.center,
                              ),
                            ),
                          ),
                          Expanded(
                            // flex: 1,
                            child: InkWell(
                              child: Icon(
                                Icons.scanner,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Colors.white,
                    ),
                  ),
                ],
              ),

              // Colors.white,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  color: Colour('424242'),
                ),
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [
                              //     Colors.white,
                              //     Colour('424242'),
                              //   ],
                              // ),
                              color: Colors.blueAccent,
                            ),
                            // child: Card(
                            child: Center(
                              child: Text('Nursery'),
                            ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [
                              //     Colors.white,
                              //     Colour('424242'),
                              //   ],
                              // ),
                              color: Colors.blueAccent,
                            ),
                            // child: Card(
                            child: Center(
                              child: Text('Primary'),
                            ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [
                              //     Colors.white,
                              //     Colour('424242'),
                              //   ],
                              // ),
                              color: Colors.blueAccent,
                            ),
                            // child: Card(
                            child: Center(
                              child: Text('Secondary'),
                            ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [
                              //     Colors.white,
                              //     Colour('424242'),
                              //   ],
                              // ),
                              color: Colors.blueAccent,
                            ),
                            // child: Card(
                            child: Center(
                              child: Text('University'),
                            ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [
                              //     Colors.white,
                              //     Colour('424242'),
                              //   ],
                              // ),
                              color: Colors.blueAccent,
                            ),
                            // child: Card(
                            child: Center(
                              child: Text('All'),
                            ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              // gradient: LinearGradient(
                              //   begin: Alignment.topCenter,
                              //   end: Alignment.bottomCenter,
                              //   colors: [
                              //     Colors.white,
                              //     Colour('424242'),
                              //   ],
                              // ),
                              color: Colors.blueAccent,
                            ),
                            // child: Card(
                            child: Center(
                              child: Text('All'),
                            ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                // color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: (2 / 2),
                      ),
                      itemCount: 24,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Card(
                              // color: Colors.transparent,
                              child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Icon(
                                                Icons.badge,
                                                size: 80,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'ItemName: $index',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    // color: Colors
                                                    //     .green[900],
                                                  ),
                                                ),
                                                Text(
                                                  'Ksh. 560',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    // color: Colors
                                                    //     .green[900],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Icon(
                                          Icons.price_change,
                                        ),
                                      ),
                                      // Positioned(
                                      //   // alignment: Alignment.bottomCenter,
                                      //   bottom: -10,
                                      //   left: 10,
                                      //   right: 10,
                                      //   child:
                                      //       // Row(
                                      //       //   mainAxisAlignment:
                                      //       //       MainAxisAlignment.spaceEvenly,
                                      //       //   crossAxisAlignment:
                                      //       //       CrossAxisAlignment.center,
                                      //       //   children: [
                                      //       // Container(
                                      //       //   padding:
                                      //       //       const EdgeInsets.only(
                                      //       //     left: 8.0,
                                      //       //     right: 8.0,
                                      //       //   ),
                                      //       //   color: Colors.green[400],
                                      //       //   child: TextButton(
                                      //       //     onPressed: () {},
                                      //       //     child: Row(
                                      //       //       mainAxisAlignment:
                                      //       //           MainAxisAlignment
                                      //       //               .center,
                                      //       //       children: [
                                      //       //         Text(
                                      //       //           'Book',
                                      //       //           style: TextStyle(
                                      //       //             fontSize: 15,
                                      //       //             color: Colors
                                      //       //                 .green[900],
                                      //       //           ),
                                      //       //         ),
                                      //       //       ],
                                      //       //     ),
                                      //       //   ),
                                      //       // ),
                                      //   //     ButtonBar(
                                      //   //   mainAxisSize: MainAxisSize.min,
                                      //   //   alignment:
                                      //   //       MainAxisAlignment.center,
                                      //   //   children: [
                                      //   //     Container(
                                      //   //       padding:
                                      //   //           const EdgeInsets.only(
                                      //   //         left: 8.0,
                                      //   //         right: 8.0,
                                      //   //       ),
                                      //   //       color: Colors.green[400],
                                      //   //       child: TextButton(
                                      //   //         onPressed: () {},
                                      //   //         child: Row(
                                      //   //           mainAxisAlignment:
                                      //   //               MainAxisAlignment
                                      //   //                   .center,
                                      //   //           children: [
                                      //   //             Text(
                                      //   //               'Book',
                                      //   //               style: TextStyle(
                                      //   //                 fontSize: 15,
                                      //   //                 color: Colors
                                      //   //                     .green[900],
                                      //   //               ),
                                      //   //             ),
                                      //   //           ],
                                      //   //         ),
                                      //   //       ),
                                      //   //     ),
                                      //   //     Container(
                                      //   //       padding:
                                      //   //           const EdgeInsets.only(
                                      //   //         left: 8.0,
                                      //   //         right: 8.0,
                                      //   //       ),
                                      //   //       color: Colors.green[400],
                                      //   //       child: TextButton(
                                      //   //         onPressed: () {},
                                      //   //         child: Row(
                                      //   //           mainAxisAlignment:
                                      //   //               MainAxisAlignment
                                      //   //                   .center,
                                      //   //           children: [
                                      //   //             Text(
                                      //   //               'Grade',
                                      //   //               style: TextStyle(
                                      //   //                 fontSize: 15,
                                      //   //                 color: Colors
                                      //   //                     .green[900],
                                      //   //               ),
                                      //   //             ),
                                      //   //           ],
                                      //   //         ),
                                      //   //       ),
                                      //   //     ),
                                      //   //   ],
                                      //   // ),

                                      //   // ],
                                      //   // ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 8,
                              // ),
                              ButtonBar(
                                // mainAxisSize: MainAxisSize.min,
                                alignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // padding: const EdgeInsets.only(
                                    //   left: 8.0,
                                    //   right: 8.0,
                                    // ),
                                    color: Colors.green[400],
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Book',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green[900],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // padding: const EdgeInsets.only(
                                    //   left: 8.0,
                                    //   right: 8.0,
                                    // ),
                                    color: Colors.green[400],
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Grade',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green[900],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // padding: const EdgeInsets.only(
                                    //   left: 8.0,
                                    //   right: 8.0,
                                    // ),
                                    color: Colors.green[400],
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green[900],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Expanded(
                              //   flex: 2,
                              //   child: Container(
                              //     color: Colors.green[400],
                              //     child: TextButton(
                              //       onPressed: () {},
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children: [
                              //           Text(
                              //             'Add to Cart ',
                              //             style: TextStyle(
                              //               fontSize: 15,
                              //               color: Colors.green[900],
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
                          )
                              // Center(
                              //   child:
                              //       Text('Grid Item'),
                              // ),
                              ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
