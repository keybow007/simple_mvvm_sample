import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm_sample/mvvm/view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVMありバージョン"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _clearData(context),
            icon: Icon(Icons.delete),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getNews(context),
        child: Icon(Icons.download),
      ),
      //TODO ViewModelの変更を受けて再描画
      body: Consumer<ViewModel>(
        builder: (context, vm, child) {
          final isProcessing = vm.isProcessing;
          final articles = vm.articles;
          if (isProcessing) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (articles.isEmpty) {
            return Container();
          } else {
            return ListView.builder(
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
            );
          }
        },
      ),
    );
  }

  _getNews(BuildContext context) {
    final vm = context.read<ViewModel>();
    //TODO: Viewでは処理をしない（ViewModel層に投げるだけ（外注）
    vm.getNews();
  }

  _clearData(BuildContext context) {
    final vm = context.read<ViewModel>();
    //TODO: Viewでは処理をしない（ViewModel層に投げるだけ（外注）
    vm.clearData();
  }
}
