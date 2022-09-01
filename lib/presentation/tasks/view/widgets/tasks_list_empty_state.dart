import 'package:flutter/material.dart';

import '../../../../utils/context_extension.dart';

class TaskListEmptyState extends StatelessWidget {
  const TaskListEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Image.asset(
              'assets/images/no-task.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            'No new tasks added yet...',
            style: context.typo.emptyStateTextsTextStyle(),
          ),
          Text(
            'Add task now :)',
            style: context.typo.emptyStateTextsTextStyle(),
          ),
        ],
      ),
    );
  }
}
