import 'package:flutter/material.dart';

class Unlock extends StatelessWidget {
  const Unlock({
    Key? key,
    required List tabColors,
    required int selectedIndex,
  })  : _tabColors = tabColors,
        _selectedIndex = selectedIndex,
        super(key: key);

  final List _tabColors;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        color: _tabColors[_selectedIndex]
        // color: Colors.green,
        );
  }
}
