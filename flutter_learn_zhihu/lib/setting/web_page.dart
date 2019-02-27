import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';

class WebPage extends StatefulWidget {
  final String url;
  WebPage(this.url);
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.widget.url,
      appBar: AppBar(
        title: Text('github'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print('$this.wight.url');
              Share.share(this.widget.url);
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.share),
            ),
          )
        ],
      ),
    );
  }
}
