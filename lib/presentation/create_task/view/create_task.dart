import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../routing/app_router_names.dart';
import '../../../utils/color_picker_items.dart';
import '../../../utils/context_extension.dart';
import '../create.dart';
import 'widget/create_task_category.dart';
import 'widget/create_task_category_picker.dart';
import 'widget/create_task_date_picker.dart';
import 'widget/create_task_name_form.dart';
import 'widget/create_task_time_picker.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocListener<CreateTaskBloc, CreateTaskState>(
        listener: (context, state) {
          if (state.status == CreateTaskStatus.success) {
            Navigator.pushReplacementNamed(
              context,
              RouteNames.main,
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create \nNew Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const CreateTaskNameForm(),
              const SizedBox(height: 20.0),
              Container(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(
                  children: const [
                    CreateTaskDatePicker(),
                    SizedBox(height: 20.0),
                    CreateTaskTimePicker(),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const CreateTaskCategory(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: BlocBuilder<CreateTaskBloc, CreateTaskState>(
                        builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                          context.read<CreateTaskBloc>().add(CreateTaskSaved());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Create Task'.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 16.0,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
