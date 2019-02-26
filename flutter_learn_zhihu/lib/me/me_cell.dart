import 'package:flutter/material.dart';
import '../utils/screen.dart';
import 'dart:math' as math;

class MeCell extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final int index;

  MeCell({this.title, this.icon, this.onPressed, this.index});

  @override
  Widget build(BuildContext context) {
    print('width of screen');
    print(Screen.width(context));
    var colors = [
      Colors.green,
      Colors.blue,
      Colors.lightBlueAccent,
      Colors.black54,
      Colors.redAccent,
      Colors.pinkAccent,
      Colors.purpleAccent,
      Colors.yellow,
      Colors.orange,
    ];
    var random = new math.Random();
    print('mediaquery + context');
    print(MediaQuery.of(context).size.width);
    return new Container(
      child: new FlatButton(
          onPressed: onPressed,
          child: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: new CircleAvatar(
                    radius: 18.0,
                    child: new Icon(icon, color: Colors.white),
                    backgroundColor: colors[random.nextInt(9)],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                new Container(
                  child: new Text(
                    title,
                    style: new TextStyle(color: Colors.black87, fontSize: 12.0),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
