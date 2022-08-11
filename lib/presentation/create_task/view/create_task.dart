import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../routing/app_router_names.dart';
import '../create.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BlocBuilder<CreateTaskBloc, CreateTaskState>(
                builder: (context, state) {
                  return TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Task Name',
                      hintStyle: TextStyle(color: Colors.grey[400]),
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
              ),
              const SizedBox(height: 20.0),
              BlocBuilder<CreateTaskBloc, CreateTaskState>(
                builder: (context, state) {
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
                            context
                                .read<CreateTaskBloc>()
                                .add(CreateTaskDateChanged(taskDate: date));
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
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
                      Text(DateFormat.yMMMMEEEEd().format(state.taskDate))
                    ],
                  );
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('From:'),
                      const SizedBox(height: 10.0),
                      BlocBuilder<CreateTaskBloc, CreateTaskState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((time) {
                                    context.read<CreateTaskBloc>().add(
                                        CreateTaskStartTimeChanged(
                                            startTime: time));
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0)),
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
                              Text(state.startTime.format(context))
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('To:'),
                      const SizedBox(height: 10.0),
                      BlocBuilder<CreateTaskBloc, CreateTaskState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((time) {
                                    context.read<CreateTaskBloc>().add(
                                        CreateTaskEndTimeChanged(
                                            endTime: time));
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0)),
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
                              Text(state.endTime.format(context))
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
                            style: const TextStyle(fontSize: 16.0),
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
