import 'package:news_app/app/core/usecases/param_usecase.dart';
import 'package:news_app/domain/entities/paging.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import 'package:tuple/tuple.dart';

class FetchHeadlineUseCase extends ParamUseCase<Paging, Tuple2<int, int>> {
  final ArticleRepository _repo;
  FetchHeadlineUseCase(this._repo);

  @override
  Future<Paging> execute(Tuple2 params) {
    return _repo.fetchHeadline(params.item1, params.item2);
  }
}
