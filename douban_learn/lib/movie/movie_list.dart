import 'package:flutter/material.dart';
import '../api/movie_api.dart';
import 'movie_detail.dart';

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
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels == _scrollCtrl.position.maxScrollExtent) {
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
      itemCount: movieList.length,
      itemBuilder: (BuildContext ctx, int i) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext ctx) {
                  return MovieDetail(
                    id:movieList[i]['id'],
                    title: movieList[i]['title'],
                  );
            }));
          },
          child: Column(
            children: <Widget>[
              Divider(
                height: 1,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 170,
                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // 左侧电影缩略图
                    Image.network(
                      movieList[i]['images']['small'],
                      width: 130,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          // 上下对齐
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // 左对齐
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            Text(
                              '电影名称：${movieList[i]['title']}',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              //TODO join(',') meaning ?
                              '电影类型：${movieList[i]['genres'].join(',')}',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '上映年份：${movieList[i]['year']}',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '豆瓣评分：${movieList[i]['rating']['average']}',
                              style: TextStyle(fontSize: 12),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '主演：',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Row(
                                  children: List.generate(
                                      movieList[i]['casts'].length,
                                      (int index) => Container(
                                        //  头像间间距
                                            margin: EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal: 5
                                            ),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  movieList[i]['casts'][index]
                                                              ['avatars'] ==
                                                          null
                                                      ? ''
                                                      : movieList[i]['casts']
                                                              [index]['avatars']
                                                          ['small']),
                                            ),
                                          )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
