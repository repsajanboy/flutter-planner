import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/tasks/task.dart';
import '../tasks.dart';
import './widget/tasks_list_header.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const TaskListHeader(),
        BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            switch (state.status) {
              case TaskStatus.success:
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return _taskBody(context, state.tasks[index]);
                  },
                );

              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }

  Widget _taskBody(BuildContext context, Task task) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 40.0,
      ),
      child: Column(children: [
        Text(task.title),
        Row(
          children: [
            Text(task.taskDate.toString()),
            Text(task.startTime.toString()),
          ],
        )
      ]),
    );
  }
}
