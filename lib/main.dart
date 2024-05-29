import 'package:flutter/material.dart';
import 'package:news_app/app/util/dependency.dart';
import 'package:news_app/presentation/app.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyCreator.init();
  DependencyCreator.initEnvironment();
  final String initialRoute = await Routes.INITIAL;

  runApp(App(
    title: "News App",
    initialRoute: initialRoute,
  ));
}
