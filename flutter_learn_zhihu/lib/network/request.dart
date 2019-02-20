import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Dio dio = Dio();

class Request {
  String baseUrl = 'https://tooxu.github.io';

  getData(String action) async {
    String getUrl = '$baseUrl/json/$action.json';
    var response = await dio.get(getUrl);
    return response.data;
  }

}
