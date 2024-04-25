import "package:flutter/material.dart";
import "package:simple_mvvm_sample/practice/news_repository.dart";

class ViewModel extends ChangeNotifier {
  final newsRepository = NewsRepository();

  void getNews() {
    newsRepository.getNews();
  }

}