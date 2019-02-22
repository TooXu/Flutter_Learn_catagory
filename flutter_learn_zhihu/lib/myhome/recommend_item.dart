import 'package:flutter/material.dart';
import '../model/recommend.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecommendListItem extends StatelessWidget {
  final Recommend recommend;

  const RecommendListItem({Key key, this.recommend}) : super(key: key);

  Widget infoItem(IconData icon, String info) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 19.0,
          color: Colors.grey,
        ),
        SizedBox(
          width: 4.0,
        ),
        Text(
          info,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            recommend.target.question.title,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 9.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    recommend.target.author.avatar_url),
              ),
              SizedBox(
                width: 9.0,
              ),
              Text(
                recommend.target.author.name,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                width: 9.0,
              ),
              Text(
                recommend.target.author.Headline,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            recommend.target.excerpt,
            style: TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              infoItem(
                  Icons.navigation, recommend.target.voteup_count.toString()),
              SizedBox(
                width: 10.0,
              ),
              infoItem(
                  Icons.comment, recommend.target.comment_count.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
