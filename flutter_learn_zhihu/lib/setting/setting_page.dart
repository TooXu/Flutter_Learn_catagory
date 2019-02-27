import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Setting1'),
                Expanded(child: Container(),),
                CupertinoSwitch(value: true, onChanged: (bool value){}),
              ],
            )
          ],
        ),
        ),
      );
  }
}
