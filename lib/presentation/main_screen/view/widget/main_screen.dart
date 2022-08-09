import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/task_repository.dart';
import '../../../../routing/app_router_names.dart';
import 'side_bar_drawer.dart';
import '../../../tasks/tasks.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.createTask);
          },
          child: const Text(' + Add New Task'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                TasksBloc(taskRepository: context.read<TaskRepository>())
                  ..add(const TasksFetched()),
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const TasksList(),
        ),
      ),
    );
  }
}
