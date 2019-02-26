import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home/home_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zhihu',
//      theme: ThemeData(
//        primaryColor: Colors.blue,
//      ),
      home: HomePage(),
    );
  }
}
