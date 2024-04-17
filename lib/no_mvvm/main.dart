import 'package:flutter/material.dart';
import 'package:simple_mvvm_sample/no_mvvm/home_screen.dart';
/*
* MVVM無しバージョン
* */

void main() => runApp(MyApp());

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

