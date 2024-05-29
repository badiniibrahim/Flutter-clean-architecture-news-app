import 'package:get/get.dart';
import 'package:news_app/domain/entities/article.dart';
import 'package:news_app/domain/entities/paging.dart';
import 'package:news_app/domain/usecases/fetch_headline_use_case.dart';
import 'package:tuple/tuple.dart';

class HeadlineController extends GetxController {
  final FetchHeadlineUseCase _fetchHeadlineUseCase;
  HeadlineController(this._fetchHeadlineUseCase);

  int _currentPage = 1;
  final int _pageSize = 20;
  bool _isLoadMore = false;
  final _paging = Rx<Paging?>(null);

  var articles = RxList<Article>([]);

  fetchData() async {
    final newPaging =
        await _fetchHeadlineUseCase.execute(Tuple2(_currentPage, _pageSize));
    articles.assignAll(newPaging.articles);
    _paging.value = newPaging;
  }

  loadMore() async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _currentPage) return;
    if (_isLoadMore) return;
    _isLoadMore = true;
    _currentPage += 1;
    final newPaging =
        await _fetchHeadlineUseCase.execute(Tuple2(_currentPage, _pageSize));
    articles.addAll(newPaging.articles);
    _paging.value?.totalResults = newPaging.totalResults;
    _isLoadMore = false;
  }
}
