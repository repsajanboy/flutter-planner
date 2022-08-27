import 'package:flutter/material.dart';

import '../presentation/main_screen/edit_category/edit.dart';
import '../presentation/splash/splash.dart';
import '../presentation/tasks/create_task/create.dart';
import '../presentation/main_screen/main.dart';

import '../presentation/tasks/edit_task/edit.dart';
import 'app_router_names.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RouteNames.createTask:
        return MaterialPageRoute(builder: (_) => const CreateTask());
      case RouteNames.editTask:
        return MaterialPageRoute(builder: (_) => const EditTask());
      case RouteNames.editCategory:
        return MaterialPageRoute(builder: (_) => const EditCategoryList());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
