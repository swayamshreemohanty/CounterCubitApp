import 'package:counter_bloc_cubit/presentation/screen/first_screen.dart';
import 'package:counter_bloc_cubit/presentation/screen/second_screen.dart';
import 'package:counter_bloc_cubit/presentation/screen/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenRouter {

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case FirstScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => FirstScreen(),
        );

      case SecondScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SecondScreen(),
        );
      case ThirdScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(),
        );
      default:
        return errorRoute();
    }
  }

  static Route errorRoute() => MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
