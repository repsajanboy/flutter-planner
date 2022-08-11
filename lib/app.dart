import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './routing/app_router.dart';
import './networking/api_client.dart';
import './repositories/task_repository.dart';

class MyApp extends StatelessWidget {
  final ApiClient apiClient;
  final AppRouter router;
  const MyApp({Key? key, required this.router, required this.apiClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TaskRepository>(
          create: (context) => TaskRepository(apiClient: apiClient),
        )
      ],
      child: MaterialApp(
        title: 'Flutter planner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'Beneth',
              fontSize: 48.0,
            ),
            bodyMedium: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
        onGenerateRoute: router.onGenerateRoute,
      ),
    );
  }
}