import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../app/routes/app_pages.dart';

class App extends StatelessWidget {
  final String title;
  final String initialRoute;

  const App({super.key, required this.title, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GetCupertinoApp(
            title: title,
            debugShowCheckedModeBanner: false,
            locale: Get.deviceLocale,
            fallbackLocale: const Locale("fr"),
            initialRoute: initialRoute,
            getPages: AppPages.routes,
          )
        : GetMaterialApp(
            title: title,
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            locale: Get.deviceLocale,
            fallbackLocale: const Locale("fr"),
            initialRoute: initialRoute,
            getPages: AppPages.routes,
          );
  }
}
