import 'package:flutter/material.dart';

import '../../../../../utils/context_extension.dart';

class EditTaskTimePicker extends StatelessWidget {
  const EditTaskTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tod = TimeOfDay.now();
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
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((time) {});
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
                const SizedBox(width: 20.0),
                Text(
                  tod.format(context),
                  style: context.typo.createTaskText(),
                )
              ],
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
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((time) {});
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
                const SizedBox(width: 20.0),
                Text(
                  tod.format(context),
                  style: context.typo.createTaskText(),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
