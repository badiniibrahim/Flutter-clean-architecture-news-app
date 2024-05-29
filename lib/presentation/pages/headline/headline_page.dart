import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/presentation/controllers/headline/headline_controller.dart';
import 'package:news_app/presentation/pages/detail/detail_page.dart';
import 'package:news_app/presentation/pages/headline/widget/article_cell.dart';

class HeadlinePage extends GetView<HeadlineController> {
  HeadlinePage({super.key});
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX(
      init: controller,
      initState: (state) {
        controller.fetchData();
      },
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Headline'),
          ),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPage(article: article));
                },
                child: ArticleCell(article: article),
              );
            },
          ),
        );
      },
    ));
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      controller.loadMore();
    }
  }
}
