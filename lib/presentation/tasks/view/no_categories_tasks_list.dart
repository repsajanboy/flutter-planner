import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/tasks/task.dart';
import '../../../routing/app_router_names.dart';
import '../../../utils/context_extension.dart';
import '../edit_task/edit.dart';
import '../tasks.dart';

class NoCategoriesTasksList extends StatelessWidget {
  const NoCategoriesTasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 100.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task List'.toUpperCase(),
                  style: context.typo.subTitle54(),
                ),
                Text(
                  'No category',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                switch (state.status) {
                  case TaskStatus.success:
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _taskBody(context, state.noCategortTasks[index]);
                      },
                      itemCount: state.noCategortTasks.length,
                    );

                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskBody(BuildContext context, Task task) {
    return InkWell(
      onTap: () {
        task.category = '';
        task.categoryId = '';
        BlocProvider.of<EditTaskBloc>(context)
            .add(EditTaskDataLoaded(task: task));
        Navigator.pushNamed(context, RouteNames.editTask);
      },
      child: Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    task.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Transform.scale(
                  scale: 1.4,
                  child: BlocBuilder<TasksBloc, TasksState>(
                    builder: (context, state) {
                      return Checkbox(
                        checkColor: Colors.white,
                        value: task.isComplete,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        onChanged: (bool? value) {
                          context.read<TasksBloc>().add(TaskCompleteChanged(
                              isComplete: value, id: task.id));
                        },
                      );
                    },
                  ),
                )
              ],
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
                  style: context.typo.subText54(),
                ),
                task.isComplete
                    ? Text(
                        'Completed !'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 14.0),
                      )
                    : Row(
                        children: [
                          Text(
                            DateFormat.Hm().format(task.startTime),
                            style: context.typo.subText54(),
                          ),
                          Text(
                            ' - ',
                            style: context.typo.subText54(),
                          ),
                          Text(
                            DateFormat.Hm().format(task.endTime),
                            style: context.typo.subText54(),
                          ),
                        ],
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
