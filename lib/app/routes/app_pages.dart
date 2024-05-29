import 'package:get/get.dart';
import 'package:news_app/presentation/bindings/headline/headline_binding.dart';
import 'package:news_app/presentation/bindings/home/home_binding.dart';
import 'package:news_app/presentation/bindings/news/news_binding.dart';
import 'package:news_app/presentation/bindings/profile/profile_binding.dart';
import 'package:news_app/presentation/pages/headline/headline_page.dart';
import 'package:news_app/presentation/pages/home/home_page.dart';
import 'package:news_app/presentation/pages/news/news_page.dart';
import 'package:news_app/presentation/pages/profile/profile_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HEADLINE,
      page: () => HeadlinePage(),
      binding: HeadlineBindings(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsPage(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
