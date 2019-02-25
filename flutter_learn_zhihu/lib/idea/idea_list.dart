import 'package:flutter/material.dart';
import '../model/idea.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IdeaList extends StatelessWidget {
  final List<Idea> ideas;
  const IdeaList({Key key, this.ideas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = ideas.map((item) {
      return IdeaListItem(
        idea: item,
      );
    }).toList();
    return Column(
      children: children,
    );
  }
}

class IdeaListItem extends StatelessWidget {
  final Idea idea;
  const IdeaListItem({Key key, this.idea}) : super(key: key);

  static const double vSpace = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(idea.author.avatar_url),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    idea.author.name,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: vSpace,
                  ),
                  Text(
                    idea.created_time.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: vSpace,
                  ),
                  Text(
                    idea.content,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: vSpace,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Image(
                      image: CachedNetworkImageProvider(idea.imageurl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
