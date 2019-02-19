import 'package:flutter/material.dart';
import '../api/movie_api.dart';

MovieApi _movieApi = MovieApi();

class MovieDetail extends StatefulWidget {
  final String id;
  final String title;

  const MovieDetail({Key key, this.id, this.title}) : super(key: key);

  @override
  MovieDetailState createState() {
    // TODO: implement createState
    return MovieDetailState();
  }
}

class MovieDetailState extends State<MovieDetail> {
  var _minfo = {};
  bool _isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMovieInfo();
  }

  _getMovieInfo() async {
    var temp = await _movieApi.getMovieDetail(widget.id);
    setState(() {
      _minfo = temp;
      print(_minfo);
      print(_minfo['summary']);
      _isloading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      appBar: AppBar(
        title: Text(
          widget.title,
          style:TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: _renderInfo(),
    );
  }

  Widget _renderInfo() {
    if (_isloading) {
      return Center (
        child: CircularProgressIndicator(),
      );
    }else {
      return ListView(
          children: <Widget>[
            Padding(
              child: Image.network(_minfo['images']['large']),
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            Container(
              child: Text(
                _minfo['summary'],

//                'dd',
                style: TextStyle(height: 1.5),
              ),
            )
          ],
      );
    }
  }

}

