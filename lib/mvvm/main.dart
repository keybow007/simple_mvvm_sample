import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm_sample/mvvm/home_screen.dart';
import 'package:simple_mvvm_sample/mvvm/news_repository.dart';
import 'package:simple_mvvm_sample/mvvm/view_model.dart';

/*
* MVVMありバージョン
* */

void main() {
  runApp(
    //TODO：DI（依存性の注入）
    MultiProvider(
      providers: [
        Provider(
          create: (_) => NewsRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => ViewModel(
            newsRepository: context.read<NewsRepository>(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}
