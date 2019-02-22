import 'package:flutter/material.dart';
import 'myhome_list.dart';
import 'hottopic_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
  }

  final _quoteButton = FlatButton.icon(
    onPressed: () {
      print('提问');
    },
    icon: Icon(Icons.edit),
    label: Text('提问'),
  );

  Widget _barSearch() {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: FlatButton.icon(
              color: Colors.black12,
              onPressed: () {},
              icon: Icon(Icons.search),
              label: Text(
                '搜索',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
        _quoteButton,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _barSearch(),
        elevation: 0,
        backgroundColor: Colors.white,

        bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.red,
            controller: _tabController,
            tabs: <Widget>[
          Tab(
            text: "关注",
          ),
          Tab(
            text: "推荐",
          ),
          Tab(
            text: "热榜",
          ),
          Tab(
            text: "视频",
          ),
        ]),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        MyHomeListView(),
        MyHomeListView(),
        HotTopicList(),
        MyHomeListView(),
      ]),
    );
  }
}
