import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/app/config/app_colors.dart';
import 'package:news_app/app/types/tab_type.dart';
import 'package:news_app/presentation/bindings/headline/headline_binding.dart';
import 'package:news_app/presentation/bindings/news/news_binding.dart';
import 'package:news_app/presentation/controllers/home/home_controller.dart';
import 'package:news_app/presentation/pages/headline/headline_page.dart';
import 'package:news_app/presentation/pages/news/news_page.dart';
import 'package:news_app/presentation/pages/profile/profile_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: TabType.values
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
            .toList(),
        inactiveColor: AppColors.lightGray,
        activeColor: AppColors.primary,
      ),
      tabBuilder: (context, index) {
        final type = TabType.values[index];
        switch (type) {
          case TabType.headline:
            HeadlineBindings().dependencies();
            return HeadlinePage();
          case TabType.news:
            NewsBinding().dependencies();
            return const NewsPage();
          case TabType.profile:
            return const ProfilePage();
        }
      },
    );
  }
}
