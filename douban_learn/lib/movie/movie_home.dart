import 'package:flutter/material.dart';

class MovieHome extends StatefulWidget {
  //  作用是什么
  MovieHome({Key key}) : super(key: key);

  @override
  MovieHomeState createState() {
    // TODO: implement createState
    return MovieHomeState();
  }
}

class MovieHomeState extends State<MovieHome> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Home'),
    Text('Hot Movie'),
    Text('Top 250'),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('Movie Home'),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
          child: new Container(
        color: Colors.white30,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('zhongruixu@gmail.com'),
              accountName: Text('TooXu'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://tooxu.github.io/%E8%90%8C%E8%90%8C%E4%BB%A3.jpeg'),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://tooxu.github.io/%E5%A4%B4%E5%83%8F.jpg'),
              )),
            ),
            ListTile(title: Text('用户反馈'), trailing: Icon(Icons.feedback),),
            ListTile(title: Text('系统设置'), trailing: Icon(Icons.settings),),
            ListTile(title: Text('我要发布'), trailing: Icon(Icons.send),),
            Divider(),
            ListTile(title: Text('注销登录'), trailing: Icon(Icons.exit_to_app),),

          ],
        ),
      )),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _selectedIndex,
          fixedColor: Colors.red,
          onTap:_onItemClicked,
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.hot_tub),title: Text('热映')),
            BottomNavigationBarItem(icon: Icon(Icons.border_top),title: Text('Top250')),
          ]

      ),

    );
  }
  void _onItemClicked (int index ) {
    setState(() {
      _selectedIndex = index;
    });
  }


}

