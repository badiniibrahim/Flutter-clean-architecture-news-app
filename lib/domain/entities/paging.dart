import 'package:news_app/domain/entities/article.dart';

class Paging {
  Paging({
    required this.totalResults,
    required this.articles,
  });

  int totalResults;
  List<Article> articles;
}
