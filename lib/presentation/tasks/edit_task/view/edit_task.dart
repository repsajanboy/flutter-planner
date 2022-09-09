import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routing/app_router_names.dart';
import '../../../../utils/context_extension.dart';
import '../../tasks.dart';
import '../edit.dart';
import 'widgets/edit_task_category.dart';
import 'widgets/edit_task_date_picker.dart';
import 'widgets/edit_task_name_form.dart';
import 'widgets/edit_task_time_picker.dart';

class EditTask extends StatelessWidget {
  const EditTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.black87,
              size: 32.0,
            ),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    'Delete Task',
                    style: context.typo.popUpTitleStyle(),
                  ),
                  content: Text(
                    'Are you sure you want to delete this task?',
                    style: context.typo.popUpContentStyle(),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'No'),
                      child: Text(
                        'No',
                        style: context.typo.popUpButtonStyle(),
                      ),
                    ),
                    BlocBuilder<EditTaskBloc, EditTaskState>(
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            context.read<EditTaskBloc>().add(DeleteTaskSelected(id: state.id));
                            Navigator.pop(context, 'Yes');
                          },
                          child: Text(
                            'Yes',
                            style: context.typo.popUpButtonStyle(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: BlocListener<EditTaskBloc, EditTaskState>(
        listener: (context, state) {
          if (state.status == EditTaskStatus.success) {
            BlocProvider.of<TasksBloc>(context).add(TasksFetched());
            BlocProvider.of<TasksBloc>(context)
                .add(TasksWithNoCategoriesLoaded());
            Navigator.pop(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20.0),
              const EditTaskNameForm(),
              const SizedBox(height: 20.0),
              Container(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(
                  children: const [
                    EditTaskDatePicker(),
                    SizedBox(height: 20.0),
                    EditTaskTimePicker(),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const EditTaskCategory(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        context.read<EditTaskBloc>().add(EditTaskSaved());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Update Task'.toUpperCase(),
                          style: context.typo.createUpdateButtonStyle(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
