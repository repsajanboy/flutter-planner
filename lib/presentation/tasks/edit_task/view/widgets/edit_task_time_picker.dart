import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/context_extension.dart';
import '../../edit.dart';

class EditTaskTimePicker extends StatelessWidget {
  const EditTaskTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start Time:',
              style: context.typo.createTaskLabel(),
            ),
            const SizedBox(height: 10.0),
            BlocBuilder<EditTaskBloc, EditTaskState>(
              builder: (context, state) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: state.startTime ,
                        ).then((time) {
                          context
                              .read<EditTaskBloc>()
                              .add(EditTaskStartTimeChanged(startTime: time));
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.red.shade100.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.red,
                          size: 32.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      state.startTime.format(context),
                      style: context.typo.createTaskText(),
                    )
                  ],
                );
              },
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'End Time:',
              style: context.typo.createTaskLabel(),
            ),
            const SizedBox(height: 10.0),
            BlocBuilder<EditTaskBloc, EditTaskState>(
              builder: (context, state) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: state.endTime,
                        ).then((time) {
                          context
                              .read<EditTaskBloc>()
                              .add(EditTaskEndTimeChanged(endTime: time));
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.red.shade100.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.access_time_outlined,
                          color: Colors.red,
                          size: 32.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      state.endTime.format(context),
                      style: context.typo.createTaskText(),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
