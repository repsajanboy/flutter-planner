import 'package:flutter/material.dart';

class TaskListHeader extends StatelessWidget {
  const TaskListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task List'.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Work',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
