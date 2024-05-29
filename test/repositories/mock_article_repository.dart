import 'dart:io';
import 'dart:convert';

import 'package:news_app/data/models/paging_model.dart';
import 'package:news_app/domain/repositories/article_repository.dart';

class MockArticleRepository extends ArticleRepository {
  @override
  Future<PagingModel> fetchHeadline(int page, int pageSize) async {
    final file = File('test/data/headline_sample.json');
    final response = await file.readAsString();
    final data = await json.decode(response);
    return PagingModel.fromJson(data);
  }

  @override
  Future<PagingModel> fetchNewsByCategory(
      String keyword, int page, int pageSize) async {
    final file = File('test/data/news_sample.json');
    final response = await file.readAsString();
    final data = await json.decode(response);
    return PagingModel.fromJson(data);
  }
}
