

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm_sample/practice/view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () => _getNews(context),
      ),
    );
  }

  _getNews(BuildContext context) {
    final vm = context.read<ViewModel>();
    vm.;
  }
}
