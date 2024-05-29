import 'package:get/get.dart';
import 'package:news_app/data/repositories/article_repository.dart';
import 'package:news_app/domain/usecases/fetch_news_use_case.dart';
import 'package:news_app/presentation/controllers/news/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchNewsUseCase(Get.find<ArticleRepositoryIml>()));
    Get.lazyPut(() => NewsController(Get.find()));
  }
}
