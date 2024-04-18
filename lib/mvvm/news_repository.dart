import 'dart:convert';

import 'package:simple_mvvm_sample/common/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY = "977d1428acaa4e859fe2c429f52ec654";

  Future<List<Article>> getNews() async {
    List<Article> result = [];

    http.Response? response;
    final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
    response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      result =  News.fromMap(jsonDecode(responseBody)).articles;
    } else {
      print("データ取得失敗");
    }
    return result;
  }


}