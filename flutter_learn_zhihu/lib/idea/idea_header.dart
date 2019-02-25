import 'package:flutter/material.dart';
import '../model/topic.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IdeaHeader extends StatefulWidget {
  final List<Topic> topics;

  const IdeaHeader({Key key, this.topics}) : super(key: key);

  @override
  _IdeaHeaderState createState() => _IdeaHeaderState();
}

class _IdeaHeaderState extends State<IdeaHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Column(
        children: <Widget>[
          Container(
            child: IdeaBanner(widget.topics),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FindCard(
                    icon: Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                    title: '热门更新了',
                  ),
                ),
                Expanded(
                  child: FindCard(
                    icon: Icon(
                      Icons.smoke_free,
                      color: Colors.blue,
                    ),
                    title: '发现知友',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class IdeaBanner extends StatelessWidget {
  final List<Topic> topics;
  IdeaBanner(this.topics);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: topics.map((info) {
          return Builder(
            builder: (
              BuildContext context,
            ) {
              return Slider(context, info);
            },
          );
        }).toList(),
        aspectRatio: 5,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }
}

Widget Slider(BuildContext context, Topic data) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    child: Container(
        child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(
            image: CachedNetworkImageProvider(data.imageUrl),
            height: 50,
            width: 100,
          ),
        ),
        Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 199,
              child: Text('正在讨论'),
            ),
            Container(
              width: 199,
              child: Text(
                data.title,
                softWrap: false,
                style: TextStyle(fontSize: 18.9),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 199,
              child: Text(
                data.content,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )),
      ],
    )),
  );
}

class FindCard extends StatelessWidget {
  final String title;
  final Widget icon;

  const FindCard({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(
              width: 15.0,
            ),
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}
