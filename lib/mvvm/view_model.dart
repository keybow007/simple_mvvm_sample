import 'package:flutter/foundation.dart';
import 'package:simple_mvvm_sample/common/news_model.dart';
import 'package:simple_mvvm_sample/mvvm/news_repository.dart';

//TODO[MVVM] ViewModel: View(UI)とModel（ロジック層）との橋渡し（ChangeNotifierを継承）
class ViewModel extends ChangeNotifier {
  final NewsRepository newsRepository;
  ViewModel({required this.newsRepository});

  List<Article> articles = [];

  bool isProcessing = false;

  void getNews() async {
    this.isProcessing = true;
    notifyListeners();

    //TODO モデル層（ロジック層）に処理を投げるだけ
    articles = await newsRepository.getNews();

    this.isProcessing = false;
    notifyListeners();
  }

  void clearData() {
    articles.clear();
    //TODO notifyListenersでView層に変更を通知
    notifyListeners();
  }




}