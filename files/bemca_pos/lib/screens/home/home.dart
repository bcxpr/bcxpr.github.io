import 'package:colour/colour.dart';
import 'package:flutter/material.dart';

import 'widgets/shopRowOne.dart';
import 'widgets/shopRowTwo.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required List tabColors,
    required int selectedIndex,
  }) :
        // _tabColors = tabColors,
        //       _selectedIndex = selectedIndex,
        super(key: key);

  // final List _tabColors;
  // final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      color: Colour('424242'),
      // _tabColors[_selectedIndex],
      child: Row(
        children: [
          ShopRowOne(),
          ShopRowTwo(),
        ],
      ),
      // color: Colors.blueGrey,
    );
  }
}
