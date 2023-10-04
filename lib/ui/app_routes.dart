import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/home/home_screen.dart';
import 'package:flutter_defualt_project/ui/splash/splash_screen.dart';
import 'package:flutter_defualt_project/ui/to_do_add/to_do_add_screen.dart';
import 'package:flutter_defualt_project/ui/to_do_detail/to_do_detail_screen.dart';

class RouteNames {
  static const String homeScreen = "/home";
  static const String detailScreen = "/detail";
  static const String addScreen = "/add";
  static const String splashScreen = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.detailScreen:
        return MaterialPageRoute(
          builder: (context) => const DetailScreen(),
        );
      case RouteNames.addScreen:
        return MaterialPageRoute(
          builder: (context) => const AddScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}