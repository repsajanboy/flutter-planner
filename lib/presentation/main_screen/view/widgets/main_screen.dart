import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routing/app_router_names.dart';
import '../../../tasks/create_task/bloc/create_task_bloc.dart';
import '../../sidebar/sidebar.dart';
import '../../../tasks/tasks.dart';
import '../../../../utils/context_extension.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    BlocProvider.of<TasksBloc>(context).add(TasksFetched());
    BlocProvider.of<TasksBloc>(context).add(TasksWithNoCategoriesLoaded());
    return Scaffold(
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
      floatingActionButton: isPortrait
          ? Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              width: double.infinity,
              child: FloatingActionButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                onPressed: () {
                  BlocProvider.of<CreateTaskBloc>(context)
                      .add(CreateTaskBackToInitial());
                  BlocProvider.of<CreateTaskBloc>(context)
                      .add(CreateTaskCategoryIndexLoaded());
                  Navigator.pushNamed(context, RouteNames.createTask);
                },
                child: Text(
                  ' + Add New Task'.toUpperCase(),
                  style: context.typo.fabTextStyle(),
                ),
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CreateTaskBloc>(context)
                    .add(CreateTaskBackToInitial());
                BlocProvider.of<CreateTaskBloc>(context)
                    .add(CreateTaskCategoryIndexLoaded());
                Navigator.pushNamed(context, RouteNames.createTask);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
      floatingActionButtonLocation: isPortrait
          ? FloatingActionButtonLocation.centerFloat
          : FloatingActionButtonLocation.endFloat,
      body: Container(
        padding: isPortrait
            ? const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 100.0)
            : const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 0.0),
        child: const TasksList(),
      ),
    );
  }
}
