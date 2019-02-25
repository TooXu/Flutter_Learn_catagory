import 'package:flutter/material.dart';
import '../model/recommend.dart';
import '../network/request.dart';
import 'recommend_item.dart';

Request request = Request();

class MyHomeListView extends StatefulWidget {
  @override
  _MyHomeListViewState createState() => _MyHomeListViewState();
}

class _MyHomeListViewState extends State<MyHomeListView> {
  List<Recommend> modules = [];
  int page = 1;
  ScrollController _scrollController = ScrollController();
  bool isPerformingRequest = false;

  Future<void> fetchData() async {
    var responseJson = await request.getData('myhome_recommend');
    var dataArr = responseJson['data'];

    List<Recommend> modules = [];
    dataArr.forEach((data) {
      modules.add(Recommend.fromJson(data));
    });

    setState(() {
      this.modules = modules;
      page = 1;
    });
  }

  Future<List<Recommend>> fakeRequest() async {
    var responseJson = await request.getData('myhome_recommend');
    List<Recommend> modules = [];
    var dataArr = responseJson['data'];
    dataArr.forEach((data) {
      modules.add(Recommend.fromJson(data));
    });
    return Future.delayed(Duration(seconds: 1), () {
      return modules;
    });
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() {
        return isPerformingRequest = true;
      });
      List<Recommend> newEntries = await fakeRequest();
      if (newEntries.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels;
        if (offsetFromBottom < edge) {
          _scrollController.animateTo(
              _scrollController.offset - (edge - offsetFromBottom),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
      setState(() {
        modules.addAll(newEntries);
        isPerformingRequest = false;
        page++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (page < 3) {
          _getMoreData();
        }
      }
    });
  }

  @override
  void dispose() {
    page = 1;
    _scrollController.dispose();
    print('dispose');
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    if (page < 3) {
      return Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 30.0),
        child: Center(
          child: Opacity(
            opacity: isPerformingRequest ? 1.0 : 0.0,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return _haveNoMore();
    }
  }

  Widget _haveNoMore() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 30.0),
          child: Text(
            "没有更过内容了，去别的地方看看吧(^_^)",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        )
      ],
    );
  }

  Widget _buildModule(BuildContext context, Recommend module) {
    return RecommendListItem(
      recommend: module,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: fetchData,
      child: ListView.builder(
        itemCount: modules.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < modules.length) {
            return _buildModule(context, modules[index]);
          } else {
            return _buildProgressIndicator();
          }
        },
        controller: _scrollController,
      ),
    );
  }
}
