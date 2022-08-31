import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/calendar/bloc/calendar_view_bloc.dart';
import '../presentation/calendar/calendar.dart';
import '../presentation/main_screen/edit_category/edit.dart';
import '../presentation/splash/splash.dart';
import '../presentation/tasks/create_task/create.dart';
import '../presentation/main_screen/main.dart';

import '../presentation/tasks/edit_task/edit.dart';
import '../repositories/category_repository.dart';
import '../repositories/task_repository.dart';
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
      case RouteNames.calendar:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CalendarViewBloc(
              taskRepository: context.read<TaskRepository>(),
              categoryRepository: context.read<CategoryRepository>(),
            )..add(CalendarMeetingLoaded()),
            child: const CalendarScreen(),
          ),
        );

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
