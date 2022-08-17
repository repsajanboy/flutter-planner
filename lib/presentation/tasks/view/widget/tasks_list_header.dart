import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/context_extension.dart';
import '../../../main_screen/sidebar/sidebar.dart';

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
}
