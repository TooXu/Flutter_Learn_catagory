import 'package:flutter/material.dart';
import '../model/recommend.dart';
import '../network/request.dart';

Request request = Request();

class MyHomeListView extends StatefulWidget {
  @override
  _MyHomeListViewState createState() => _MyHomeListViewState();
}

class _MyHomeListViewState extends State<MyHomeListView> {

  List<Recommend> modules = [];

  Future<void> fetchData() async{
    var responseJson = await request.getData( 'myhome_recommend');
    var dataArr = responseJson['data'];
//    print('responseJson = $dataArr');

    List<Recommend> modules = [];
    int page = 1;

    dataArr.forEach((data) {
      print(data);
      modules.add(Recommend.fromJson(data));
    });

    print('responsJson + $modules');
    setState(() {
      this.modules = modules;
      page = 1;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: modules.length + 1,
      itemBuilder: (BuildContext context, int index) {


      },
    );
  }
}
