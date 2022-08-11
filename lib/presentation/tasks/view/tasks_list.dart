import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
                  itemCount: state.tasks.length,
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
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.d()
                    .add_MMM()
                    .add_y()
                    .format(task.taskDate)
                    .toUpperCase(),
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Row(
                children: [
                  Text(
                    DateFormat.Hm().format(task.startTime),
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  const Text(
                    ' - ',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    DateFormat.Hm().format(task.endTime),
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
