import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../myhome/myhome_page.dart';
import 'package:flutter_learn_zhihu/idea/idea_page.dart';
import '../campus/campus_page.dart';
import '../message/message_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  List<Icon> _tabImages = [
    Icon(
      Icons.view_list,
      color: Colors.grey,
    ),
    Icon(
      Icons.power_input,
      color: Colors.grey,
    ),
    Icon(
      Icons.watch_later,
      color: Colors.grey,
    ),
    Icon(
      Icons.toys,
      color: Colors.grey,
    ),
    Icon(
      Icons.wb_incandescent,
      color: Colors.grey,
    ),
  ];

  List<Icon> _selectedTabImages = [
    Icon(
      Icons.view_list,
      color: Colors.pinkAccent,
    ),
    Icon(
      Icons.power_input,
      color: Colors.pinkAccent,
    ),
    Icon(
      Icons.watch_later,
      color: Colors.pinkAccent,
    ),
    Icon(
      Icons.toys,
      color: Colors.pinkAccent,
    ),
    Icon(
      Icons.wb_incandescent,
      color: Colors.pinkAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          MyHomePage(),
          IdeaPage(),
          CampusPage(),
          MessagePage(),
          Text('5'),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Colors.green,
        
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: _getIcon(0), title: Text('home')),
          BottomNavigationBarItem(icon: _getIcon(1), title: Text('想法')),
          BottomNavigationBarItem(icon: _getIcon(2), title: Text('大学')),
          BottomNavigationBarItem(icon: _getIcon(3), title: Text('消息')),
          BottomNavigationBarItem(icon: _getIcon(4), title: Text('我')),

        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Icon _getIcon(int index) {
    if (index == _tabIndex) {
      return _selectedTabImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
