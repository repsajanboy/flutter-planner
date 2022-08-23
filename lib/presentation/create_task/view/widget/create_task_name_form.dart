import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../create.dart';
import '../../../../utils/context_extension.dart';
class CreateTaskNameForm extends StatelessWidget {
  const CreateTaskNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskBloc, CreateTaskState>(
      builder: (context, state) {
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
          onChanged: (value) {
            context
                .read<CreateTaskBloc>()
                .add(CreateTaskTitleChanged(title: value));
          },
        );
      },
    );
  }
}
