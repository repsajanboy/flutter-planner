import 'package:flutter/material.dart';

import '../../../../../utils/context_extension.dart';

class EditTaskNameForm extends StatelessWidget {
  const EditTaskNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: context.typo.taskNameStyle(),
      decoration: InputDecoration(
        hintText: 'Task Name',
        hintStyle: context.typo.taskNameHintStyle(),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black54)),
      ),
      onChanged: (value) {},
    );
  }
}
