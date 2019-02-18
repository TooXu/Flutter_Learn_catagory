import 'package:dio/dio.dart';

Dio dio = new Dio();

class MovieApi {

  getMovieList(String mt, int page, int pageSize) async {
    String listUrl = 'https://tooxu.github.io/movie_homeList.json';
    var result = await dio.get(listUrl);
    return result.data;
  }
  
  getMovieDetail(String id) async {
    var result = await dio.get('https://tooxu.github.io/doubanMovie.json');
    return result.data;
  }

  int add(int n) {
    return ++n;
  }
  int sub(int n) {
    return --n;
  }
  

}