part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static Future<String> get INITIAL async {
    return Routes.HOME;
  }

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const HEADLINE = _Paths.HEADLINE;
  static const NEWS = _Paths.NEWS;
  static const PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = "/splash";
  static const HOME = '/home';
  static const HEADLINE = '/headline';
  static const NEWS = '/news';
  static const PROFILE = '/profile';
}
