import 'package:news_app/app/core/usecases/param_usecase.dart';
import 'package:news_app/domain/entities/paging.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import 'package:tuple/tuple.dart';

class FetchNewsUseCase extends ParamUseCase<Paging, Tuple3<String, int, int>> {
  final ArticleRepository _repo;
  FetchNewsUseCase(this._repo);

  @override
  Future<Paging> execute(Tuple3 params) {
    return _repo.fetchNewsByCategory(params.item1, params.item2, params.item3);
  }
}
