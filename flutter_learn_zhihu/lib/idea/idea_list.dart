import 'package:flutter/material.dart';
import '../model/idea.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../utils/screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(idea.author.avatar_url),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    idea.author.name,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    idea.created_time.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  width: Screen.width(context) * 0.8,
                  child: Text(
                    idea.content,
                    softWrap: true,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                    image: CachedNetworkImageProvider(idea.imageurl),
                    width: 250,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
