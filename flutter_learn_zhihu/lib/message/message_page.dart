import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'message_list.dart';
import '../model/message.dart';
import '../network/request.dart';

Request request = Request();

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Message> messages = [];

  Future<void> fetchData() async {
    var response = await request.getData('message');

    List messagesArr = response['data'];
    List<Message> messages = [];

    messagesArr.forEach((data) {
      messages.add(Message.fromJson(data));
    });

    setState(() {
      this.messages = messages;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('消息'),
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.list),
            onTap: _iconClicked,
          ),
          //Bug: 点击 button AppBar 阴影消失
          CupertinoButton(child: Icon(Icons.map), onPressed: _iconClicked),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: <Widget>[
          MessageList(messages: messages),
        ],
      ),
    );
  }

  void _iconClicked() {
    print('_iconClicked');
  }
}
