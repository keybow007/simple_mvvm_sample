import 'package:flutter/material.dart';
import 'package:simple_mvvm_sample/mvvm/home_screen.dart';

/*
* MVVMありバージョン
* */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreenMvvm(),
    );
  }
}

