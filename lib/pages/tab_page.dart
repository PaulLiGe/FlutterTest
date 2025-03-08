import 'package:flutter/material.dart';
import 'package:test01/pages/home_page_1.dart';
import 'package:test01/pages/homepage.dart';
import 'package:test01/pages/hot_page.dart';
import 'package:test01/pages/my_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currendTabIdx = 0;

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: SafeArea(
          child: IndexedStack(
        index: _currendTabIdx,
        children: _tabPages(),
      )),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currendTabIdx = value;
            });
          },
          currentIndex: _currendTabIdx,
          items: _bottomTabBarItems()),
    );
  }

  List<BottomNavigationBarItem> _bottomTabBarItems() {
    final item1 = BottomNavigationBarItem(
      label: '首页',
      icon: Icon(
        Icons.message,
      ),
    );
    final item2 = BottomNavigationBarItem(
        label: '副页',
        icon: Icon(
          Icons.heart_broken,
        ));
    final item3 = BottomNavigationBarItem(
        label: '热点',
        icon: Icon(
          Icons.hot_tub,
        ));
    return [item1, item2, item3];
  }

  List<Widget> _tabPages() {
    return [HomePage(), HomePage1(), HotPage(), MyPage()];
  }
}
