import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm_sample/practice/view_model.dart';

import 'home_screen.dart';

/*
* 演習バージョン
* */

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ViewModel(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
