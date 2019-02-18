import 'package:flutter/material.dart';
import 'movie/movie_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:'Douban Movie',
      home: MovieHome(

      ),
    );
  }

}