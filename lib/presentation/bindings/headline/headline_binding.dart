import 'package:get/get.dart';
import 'package:news_app/data/repositories/article_repository.dart';
import 'package:news_app/domain/usecases/fetch_headline_use_case.dart';
import 'package:news_app/presentation/controllers/headline/headline_controller.dart';

class HeadlineBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchHeadlineUseCase(Get.put(ArticleRepositoryIml())));
    Get.lazyPut(() => HeadlineController(Get.find()));
  }
}
