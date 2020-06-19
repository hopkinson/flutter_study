import 'package:flutter/material.dart';
import 'package:flutter_study/pages/home_page.dart';
import 'package:flutter_study/pages/my_page.dart';
import 'package:flutter_study/pages/search_page.dart';
import 'package:flutter_study/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  // 底部导航记录的index
  int _selectedIndex = 0;
  // 默认的颜色
  MaterialColor _defaultColor = Colors.grey;
  // 激活的颜色
  MaterialColor _activeColor = Colors.blue;

  // 点击tap
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      print(_controller);
      _controller.jumpToPage(index);
    });
  }

  // 页面控制器
  PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _controller,
          children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 25.0,
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: _defaultColor,
                  ),
                  activeIcon: Icon(
                    Icons.add_to_home_screen,
                    color: _activeColor,
                  ),
                  title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: _defaultColor),
                  activeIcon: Icon(
                    Icons.mail_outline,
                    color: _activeColor,
                  ),
                  title: Text('搜索')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel, color: _defaultColor),
                  activeIcon: Icon(Icons.card_giftcard, color: _activeColor),
                  title: Text('旅拍')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: _defaultColor),
                  activeIcon: Icon(Icons.person_outline, color: _activeColor),
                  title: Text('我的')),
            ],
            fixedColor: _activeColor,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTap));
  }
}
