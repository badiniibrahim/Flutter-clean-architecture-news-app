import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:news_app/app/util/environment.dart';
import 'package:news_app/data/repositories/auth_repository.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => AuthenticationRepositoryIml());
  }

  static Future<void> initEnvironment() async {
    await dotenv.load(fileName: Environment.fileName);
  }
}
