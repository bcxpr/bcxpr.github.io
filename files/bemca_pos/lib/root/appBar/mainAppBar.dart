import 'package:brainschild_pos/root/tabBar/customTabBar.dart';
import 'package:colour/colour.dart';
import 'package:flutter/material.dart';

import 'customAppBar.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required TabController controller,
    required List tabIndicatorColors,
    required int selectedIndex,
    required List tabAccentColors,
  })  : _controller = controller,
        _tabIndicatorColors = tabIndicatorColors,
        _selectedIndex = selectedIndex,
        _tabAccentColors = tabAccentColors,
        super(key: key);

  final TabController _controller;
  final List _tabIndicatorColors;
  final int _selectedIndex;
  final List _tabAccentColors;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor:
            // Colour('#38ef7d'),
            Colour('424242'),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppBar(),
            CustomTabBar(
                controller: _controller,
                tabIndicatorColors: _tabIndicatorColors,
                selectedIndex: _selectedIndex,
                tabAccentColors: _tabAccentColors),
          ],
        ));
  }
}
