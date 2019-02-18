import 'package:flutter/material.dart';
import '../api/movie_api.dart';

MovieApi movieApi = new MovieApi();

class MovieList extends StatefulWidget {

  const MovieList({Key key, this.mt}) : super(key: key);
  final String mt;
  @override
  MovieListState createState() {
    // TODO: implement createState
    return MovieListState();
  }

}

class MovieListState extends State<MovieList> {

  var movieList = [];
  int _page = 1;
  int _pageSize = 10;
  int _total = 0;
  bool _isover = false;
  bool _isLoading = false;
  ScrollController _scrollCtrl;

  @override
  void initState() {
    super.initState();
    _scrollCtrl = new ScrollController();
    _scrollCtrl.addListener((){
      if(_scrollCtrl.position.pixels == _scrollCtrl.position.maxScrollExtent) {
        if (_isLoading || _isover) return;
        if (_page * _pageSize >= _total) {
          setState(() {
            _isover = true;
          });
          return;
        }

        setState(() {
          _page++;
        });

        getMovieList();
      }
    });
    getMovieList();
  }

  void getMovieList() async {
    setState(() {
      _isLoading = true;
    });

    var temp = await movieApi.getMovieList(widget.mt, _page, _pageSize);

    setState(() {
      movieList.addAll(temp['subjects']);
      _total = temp['total'];
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: movieList.length ,
      itemBuilder: (BuildContext ctx,int i) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx){

            }));
          },
          child: Column(
            children: <Widget>[
              Divider(height: 1,),
              Container(
                margin: EdgeInsets.all(10),
                height: 280,
                child: Row (
                  children: <Widget>[
                    Image.network(
                      movieList[i]['images']['small'],
                      width: 150,
                      height: 280,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              )
            ],
          ),
        );

      },

    );
  }

}