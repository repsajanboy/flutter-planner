import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/task_repository.dart';
import '../presentation/create_task/create.dart';
import '../presentation/main_screen/main.dart';

import 'app_router_names.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RouteNames.createTask:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CreateTaskBloc(
              taskRepository: context.read<TaskRepository>(),
            ),
            child: const CreateTask(),
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
