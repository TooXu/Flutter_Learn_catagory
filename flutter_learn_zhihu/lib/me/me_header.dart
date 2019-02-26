import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String avatarUrl = 'https://tooxu.github.io/%E5%A4%B4%E5%83%8F.jpg';
    final String Introduction =
        'You can use SystemChrome class to change Status bar and Navigation bar color.';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(avatarUrl),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Tooxu',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              Introduction,
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 10),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: NumTitleItem(132, '我的创作'),
                ),
                Expanded(
                  flex: 1,
                  child: NumTitleItem(23, '关注'),
                ),
                Expanded(
                  flex: 1,
                  child: NumTitleItem(87, '收藏夹'),
                ),
                Expanded(
                  flex: 1,
                  child: NumTitleItem(20, '最近浏览'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget NumTitleItem(int num, String title) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: <Widget>[
            Text('$num'),
            SizedBox(height: 10),
            Text(
              '$title',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
