import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/context_extension.dart';

class EditTaskDatePicker extends StatelessWidget {
  const EditTaskDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2222),
            ).then((date) {
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              color: Colors.orange.shade100.withOpacity(0.5),
            ),
            child: const Icon(
              Icons.calendar_month,
              color: Colors.orange,
              size: 32.0,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Text(
          DateFormat.yMMMMEEEEd().format(DateTime.now()),
          style: context.typo.createTaskText(),
        )
      ],
    );
  }
}
