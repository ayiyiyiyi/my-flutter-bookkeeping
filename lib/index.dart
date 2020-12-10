import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/statistics.dart';
import 'pages/messageBoard.dart';
import './components/Drawer.dart';

import './config.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentPageIndex = 0;
  StatefulWidget _currentPage;
  List<StatefulWidget> _pages;

  void initState() {
    super.initState();
    _pages = <StatefulWidget>[
      new Home(),
      new Statistics(),
      new MessageBoard(),
      // new Bookkeep(),
      // new AddMessage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.receipt_outlined),
                activeIcon: new Icon(Icons.receipt_rounded),
                label: '流水'),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.pie_chart_outline_rounded),
                activeIcon: new Icon(Icons.pie_chart_rounded),
                label: '统计'),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.markunread_outlined),
                activeIcon: new Icon(Icons.markunread_rounded),
                label: '留言')
          ],
          fixedColor: Global.textColor,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentPageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          }),
    );
  }
}
