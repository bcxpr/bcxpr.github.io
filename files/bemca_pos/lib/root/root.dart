import 'package:brainschild_pos/body/body.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'appBar/mainAppBar.dart';

class Root extends StatefulWidget {
  Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  final List _tabColors = [
    Colors.blueGrey[300],
    Colors.red[300],
    Colors.blue[300],
    Colors.yellow[300],
    Colors.purple[300],
    Colors.amber[300],
    Colors.green[300],
  ];
  final List _tabAccentColors = [
    Colors.blueGrey[400],
    Colors.red[400],
    Colors.blue[400],
    Colors.yellow[400],
    Colors.purple[400],
    Colors.amber[400],
    Colors.green[400],
  ];

  final List _tabIndicatorColors = [
    Colors.blueGrey[100],
    Colors.red[100],
    Colors.blue[100],
    Colors.yellow[100],
    Colors.purple[100],
    Colors.amber[100],
    Colors.green[100],
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 7,
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _controller.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 50),
          child: MainAppBar(
              controller: _controller,
              tabIndicatorColors: _tabIndicatorColors,
              selectedIndex: _selectedIndex,
              tabAccentColors: _tabAccentColors),
        ),
        body: MainBody(
            controller: _controller,
            tabColors: _tabColors,
            selectedIndex: _selectedIndex),
      ),
    );
  }
}
























   // indicator: BoxDecoration(
                        //   borderRadius: BorderRadius.only(
                        //     topRight: Radius.circular(25),
                        //     topLeft: Radius.circular(25),
                        //     // bottomRight: Radius.circular(25),
                        //   ),
                        //   color: _tabColors[_selectedIndex],
                        // ),

                           // Expanded(
                          //   flex: 1,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Icon(
                          //         Icons.menu,
                          //         size: 30,
                          //       ),
                          //     ],
                          //   ),
                          // ),