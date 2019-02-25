import 'package:flutter/material.dart';
import '../model/message.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  const MessageList({Key key, this.messages}) : super(key: key);

  Widget buildModule(BuildContext context, Message module) {
    return MessageItem(
      message: module,
    );
  }

  @override
  Widget build(BuildContext context) {
    var children = messages
        .map((item) => MessageItem(
              message: item,
            ))
        .toList();

    return Column(
      children: children,
    );
  }
}

class MessageItem extends StatelessWidget {
  final Message message;
  const MessageItem({Key key, this.message}) : super(key: key);
  static const double vSpace = 6.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: CircleAvatar(
              child: Icon(Icons.favorite),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '赞同',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: vSpace,
                  ),
                  Text('信息通知'),
                  SizedBox(
                    height: vSpace,
                  ),
                  Text(
                    message.content,
                    softWrap: true,
                  ),
                  SizedBox(
                    height: vSpace,
                  ),
                  Text('xx天前'),
                  Divider(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
