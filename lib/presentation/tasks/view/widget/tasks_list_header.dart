import 'package:flutter/material.dart';

import '../../../../utils/context_extension.dart';
class TaskListHeader extends StatelessWidget {
  const TaskListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task List'.toUpperCase(),
          style: context.typo.subTitle54(),
        ),
        Text(
          'Work',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
