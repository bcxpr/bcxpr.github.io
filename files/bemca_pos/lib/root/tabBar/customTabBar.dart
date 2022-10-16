import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
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
    return TabBar(
      controller: _controller,
      indicatorWeight: 8,
      indicatorColor: _tabIndicatorColors[_selectedIndex],
      tabs: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FaIcon(FontAwesomeIcons.store, color: _tabAccentColors[0]),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FaIcon(FontAwesomeIcons.receipt, color: _tabAccentColors[1]),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FaIcon(FontAwesomeIcons.chartLine, color: _tabAccentColors[2]),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FaIcon(FontAwesomeIcons.history, color: _tabAccentColors[3]),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FaIcon(FontAwesomeIcons.scroll, color: _tabAccentColors[4]),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FaIcon(FontAwesomeIcons.cog, color: _tabAccentColors[5]),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FaIcon(FontAwesomeIcons.unlockAlt, color: _tabAccentColors[6]),
        ),
      ],
    );
  }
}
