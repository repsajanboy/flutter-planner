import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/task_repository.dart';
import '../../../../routing/app_router_names.dart';
import '../../../tasks/create_task/bloc/create_task_bloc.dart';
import '../../sidebar/sidebar.dart';
import '../../../tasks/tasks.dart';
import '../../../../utils/context_extension.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(
            taskRepository: context.read<TaskRepository>(),
            sidebarBloc: BlocProvider.of<SidebarBloc>(context),
          )..add(TasksFetched()),
        ),
      ],
      child: Scaffold(
        drawer: const SideBarDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.calendar_today_rounded,
                color: Colors.black,
                size: 32.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.calendar);
              },
            )
          ],
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          width: double.infinity,
          child: FloatingActionButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            onPressed: () {
              BlocProvider.of<CreateTaskBloc>(context).add(CreateTaskBackToInitial());
              Navigator.pushNamed(context, RouteNames.createTask);
            },
            child: Text(
              ' + Add New Task'.toUpperCase(),
              style: context.typo.fabTextStyle(),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 100.0),
          child: const TasksList(),
        ),
      ),
    );
  }
}
