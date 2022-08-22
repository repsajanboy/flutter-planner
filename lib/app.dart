import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './routing/app_router.dart';
import './networking/api_client.dart';
import './repositories/task_repository.dart';
import 'presentation/theme/theme.dart';
import 'repositories/category_repository.dart';
import './presentation/main_screen/sidebar/sidebar.dart';
import './presentation/create_task/create.dart';
class MyApp extends StatelessWidget {
  final ApiClient apiClient;
  final AppRouter router;
  const MyApp({Key? key, required this.router, required this.apiClient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TaskRepository>(
          create: (context) => TaskRepository(apiClient: apiClient),
        ),
        RepositoryProvider<CategoryRepository>(
          create: (context) => CategoryRepository(apiClient: apiClient),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SidebarBloc(
                categoryRepository: context.read<CategoryRepository>())
              ..add(CategoriesFetched()),
          ),
          BlocProvider(
            create: (context) =>
                ThemeBloc(sidebarBloc: BlocProvider.of<SidebarBloc>(context)),
          ),
          BlocProvider(
            create: (context) => CreateTaskBloc(
              taskRepository: context.read<TaskRepository>(),
              sidebarBloc: BlocProvider.of<SidebarBloc>(context),
            )..add(CreateTaskCategoryIndexLoaded()),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: _buildWithTheme,
        ),
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      title: 'Flutter planner',
      debugShowCheckedModeBanner: false,
      theme: state.themeData,
      // theme: ThemeData(
      //   textTheme: ThemeData.light().textTheme.copyWith(
      //         titleLarge: const TextStyle(
      //           fontFamily: 'Beneth',
      //           fontSize: 48.0,
      //         ),
      //         bodyMedium: const TextStyle(
      //           fontFamily: 'Nunito',
      //           fontSize: 20.0,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      // ),
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}
