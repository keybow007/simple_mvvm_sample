import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_mvvm_sample/common/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM無しバージョン"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _clearData(),
            icon: Icon(Icons.delete),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getNews(),
        child: Icon(Icons.download),
      ),
      body: (isProcessing)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (articles.isEmpty)
              ? Container()
              : ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return Card(
                      child: ListTile(
                        title: Text(article.title ?? "タイトル無し"),
                        subtitle: Text(article.description ?? "記事詳細無し"),
                      ),
                    );
                  },
                ),
    );
  }

  _getNews() async {
    const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
    const API_KEY = "977d1428acaa4e859fe2c429f52ec654";

    setState(() {
      this.isProcessing = true;
    });

    http.Response? response;
    final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
    response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      articles = News.fromMap(jsonDecode(responseBody)).articles;
    } else {
      print("データ取得失敗");
    }

    setState(() {
      this.isProcessing = false;
    });
  }

  _clearData() {
    setState(() {
      articles.clear();
    });
  }
}
