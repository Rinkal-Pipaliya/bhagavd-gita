import 'package:departur_app/screen/home/view/home_screen.dart';
import 'package:departur_app/screen/slock/view/slock_screen.dart';
import 'package:departur_app/screen/splash/view/splash_screen.dart';
import 'package:departur_app/screen/verse/view/verse_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static String splashPage = '/';
  static String homePage = 'home';
  static String slockPage = 'slock';
  static String versePage = 'verse';
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.splashPage: (_) => const SplashScreen(),
    Routes.homePage: (_) => const HomeScreen(),
    Routes.slockPage: (_) => const SlockScreen(),
    Routes.versePage: (_) => const VerseScreen(),
  };
}
