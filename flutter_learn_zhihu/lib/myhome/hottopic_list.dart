import 'package:flutter/material.dart';
import '../model/hottopic.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HotTopicList extends StatefulWidget {
  @override
  _HotTopicListState createState() => _HotTopicListState();
}

class _HotTopicListState extends State<HotTopicList> {
  List<RankItem> rankList = itemList;

  Widget _buildItem(RankItem rank) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  alignment: Alignment.topLeft,
                  child: Text(
                    rank.order,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: rank.order.compareTo("03") <= 0 ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  rank.title,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                rank.mark != null
                    ? Text(
                        rank.mark,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Container(),
                Text(rank.hotNum),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: AspectRatio(
                  aspectRatio: 3.0 / 2.0,
                  child: Container(
                    alignment: Alignment.center,
                    foregroundDecoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(rank.imgUrl),
                          centerSlice:
                              new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        )),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: rankList.length,
          itemBuilder: (context, i) {
            return _buildItem(rankList[i]);
          }),
    );
  }
}
