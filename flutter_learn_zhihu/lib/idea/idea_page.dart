import 'package:flutter/material.dart';
import 'idea_header.dart';
import '../model/topic.dart';
import '../network/request.dart';
import '../model/idea.dart';
import 'idea_list.dart';

Request request = Request();

class IdeaPage extends StatefulWidget {
  @override
  _IdeaPageState createState() => _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {

  ScrollController scrollController = ScrollController();

  List<Topic> topics = [];
  List<Idea> ideas = [];

  @override
  void initState() {
    super.initState();
    fetchData();

    scrollController.addListener((){
      var offset = scrollController.offset;
      if (offset < 0) {

      }
    });

  }

  Future<void> fetchData() async {
    var response = await request.getData('idea_topic');
    var dataArr = response['data'];
    List topicJson = dataArr['topic'];
    List ideaJson = dataArr['idea'];

    List<Topic> tempTopics = [];
    topicJson.forEach((data) {
      tempTopics.add(Topic.fromJson(data));
    });

    List<Idea> tempIdeas = [];
    ideaJson.forEach((data){
      tempIdeas.add(Idea.fromJson(data));
    });

    setState(() {
      this.topics = tempTopics;
      this.ideas = tempIdeas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '想法',
          style: TextStyle(
              color: Colors.black, fontSize: 29.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
          child: ListView(
            controller: scrollController,
            children: <Widget>[
              IdeaHeader(topics: this.topics),
              IdeaList(ideas: this.ideas,),
            ],
          ),
          onRefresh: fetchData,
      ),
    );
  }
}
