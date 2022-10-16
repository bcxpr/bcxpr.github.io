import 'package:brainschild_pos/screens/graphs/graphs.dart';
import 'package:brainschild_pos/screens/history/history.dart';
import 'package:brainschild_pos/screens/home/home.dart';
import 'package:brainschild_pos/screens/receipts/receipts.dart';
import 'package:brainschild_pos/screens/records/records.dart';
import 'package:brainschild_pos/screens/settings/settings.dart';
import 'package:brainschild_pos/screens/unlock/unlock.dart';
import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
    required TabController controller,
    required List tabColors,
    required int selectedIndex,
  })  : _controller = controller,
        _tabColors = tabColors,
        _selectedIndex = selectedIndex,
        super(key: key);

  final TabController _controller;
  final List _tabColors;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      // color: Colour('424242'),
      child: Row(
        children: [
          Expanded(
            child: TabBarView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Home(tabColors: _tabColors, selectedIndex: _selectedIndex),
                Receipts(tabColors: _tabColors, selectedIndex: _selectedIndex),
                Graphs(tabColors: _tabColors, selectedIndex: _selectedIndex),
                History(tabColors: _tabColors, selectedIndex: _selectedIndex),
                Records(tabColors: _tabColors, selectedIndex: _selectedIndex),
                Settings(tabColors: _tabColors, selectedIndex: _selectedIndex),
                Unlock(tabColors: _tabColors, selectedIndex: _selectedIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
