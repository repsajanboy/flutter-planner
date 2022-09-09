import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/context_extension.dart';
import '../../edit.dart';

class EditTaskNameForm extends StatelessWidget {
  const EditTaskNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTaskBloc, EditTaskState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          autofocus: false,
          cursorColor: Colors.black,
          style: context.typo.taskNameStyle(),
          initialValue: state.title,
          decoration: InputDecoration(
            hintText: 'Task Name',
            hintStyle: context.typo.taskNameHintStyle(),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
          ),
          onChanged: (value) {
            context
                .read<EditTaskBloc>()
                .add(EditTaskTitleChanged(title: value));
          },
        );
      },
    );
  }
}
