import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/my_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  int _currentPage = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {

    // 监听 pageView 的滑动，也要同步去改变底部的 item
    _controller.addListener(() {
      double? page = _controller.page;
      if (page != null) {
        if (page >= 0 && page < 0.5) {
          _currentPage = 0;
        } else if (page >= 0.5 && page < 1.5) {
          _currentPage = 1;
        } else if (page >= 1.5 && page < 2.5) {
          _currentPage = 2;
        } else if (page >= 2.5 && page <= 3) {
          _currentPage = 3;
        }

        setState(() {
          _currentIndex = _currentPage;
        });
      }
    });

    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _defaultColor),
              activeIcon: Icon(Icons.home, color: _activeColor),
              label: "首页"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _defaultColor),
              activeIcon: Icon(Icons.search, color: _activeColor),
              label: "搜索"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, color: _defaultColor),
              activeIcon: Icon(Icons.camera_alt, color: _activeColor),
              label: "旅拍"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _defaultColor),
              activeIcon: Icon(Icons.account_circle, color: _activeColor),
              label: "我的"),
        ],
      ),
    );
  }
}
