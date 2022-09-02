import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/context_extension.dart';
import '../../../main_screen/sidebar/sidebar.dart';
import '../../tasks.dart';

class TaskListHeader extends StatelessWidget {
  const TaskListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Task List'.toUpperCase(),
              style: context.typo.subTitle54(),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                if (state.filteredTasks.isEmpty) {
                  if(state.isCompletedEmpty == 'empty') {
                    return _popUpFilterMenu();
                  }
                  return const SizedBox();
                }
                return _popUpFilterMenu();
              },
            )
          ],
        ),
        BlocBuilder<SidebarBloc, SidebarState>(
          builder: (context, state) {
            return Text(
              state.selectedCategoryName,
              style: Theme.of(context).textTheme.titleLarge,
            );
          },
        ),
      ],
    );
  }

  Widget _popUpFilterMenu() {
    return PopupMenuButton(
      icon: const Icon(Icons.filter_list_rounded),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return TextButton(
                onPressed: () {
                  BlocProvider.of<TasksBloc>(context).add(ShowAllListSelected());
                  Navigator.pop(context);
                },
                child: const Text('Show All'),
              );
            },
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              BlocProvider.of<TasksBloc>(context).add(ShowActiveListSelected());
              Navigator.pop(context);
            },
            child: const Text('Show Active'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              BlocProvider.of<TasksBloc>(context).add(ShowCompletedListSelected());
              Navigator.pop(context);
            },
            child: const Text('Show Completed'),
          ),
        ),
      ],
    );
  }
}
