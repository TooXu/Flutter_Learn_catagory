import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_learn_zhihu/myhome/myhome_list.dart';

class CampusPage extends StatefulWidget {
  @override
  _CampusPageState createState() => _CampusPageState();
}

class _CampusPageState extends State<CampusPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tooxu',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            Text(
              'Campus',
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
        centerTitle: false,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                'https://tooxu.github.io/%E8%90%8C%E8%90%8C%E4%BB%A3.jpeg'),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: '课堂',
            ),
            Tab(
              text: '读书会',
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        MyHomeListView(),
        MyHomeListView(),
      ]),
    );
  }
}
