import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../routing/app_router_names.dart';
import '../../../utils/color_picker_items.dart';
import '../../../utils/context_extension.dart';
import '../../main_screen/sidebar/sidebar.dart';
import '../create.dart';

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
              BlocBuilder<CreateTaskBloc, CreateTaskState>(
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
              ),
              const SizedBox(height: 20.0),
              Container(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
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
                                  context.read<CreateTaskBloc>().add(
                                      CreateTaskDateChanged(taskDate: date));
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                  color:
                                      Colors.orange.shade100.withOpacity(0.5),
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
                              DateFormat.yMMMMEEEEd().format(state.taskDate),
                              style: context.typo.createTaskText(),
                            )
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
                            Text(
                              'Start Time:',
                              style: context.typo.createTaskLabel(),
                            ),
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
                                                    startTime: time),
                                              );
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20.0)),
                                          color: Colors.red.shade100
                                              .withOpacity(0.5),
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
                                          color: Colors.red.shade100
                                              .withOpacity(0.5),
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
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              BlocBuilder<CreateTaskBloc, CreateTaskState>(
                builder: (context, state) {
                  final _color = colorPickerItems
                      .firstWhere((e) => e.id == state.categoryTheme);
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30.0)),
                        ),
                        builder: (BuildContext context) {
                          return BlocBuilder<SidebarBloc, SidebarState>(
                            builder: (context, state) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 20.0),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.black,),
                                  itemCount: state.categories.length,
                                  itemBuilder: (context, index) {
                                    final _color = colorPickerItems.firstWhere(
                                        (e) =>
                                            e.id ==
                                            state.categories[index].theme);
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0, top: 8.0),
                                      child: ListTile(
                                        leading: Card(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                          ),
                                          elevation: 5.0,
                                          color: _color.colors,
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: Center(
                                              child: Text(
                                                state.categories[index].name
                                                    .substring(0, 1),
                                                style: const TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          state.categories[index].name,
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        onTap: () {
                                          BlocProvider.of<CreateTaskBloc>(
                                                  context)
                                              .add(CreateTaskCategoryChanged(
                                            category:
                                                state.categories[index].name,
                                            categoryTheme:
                                                state.categories[index].theme,
                                          ));
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                              
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 10.0, top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                  color: _color.colors!.withOpacity(0.3),
                                ),
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: Center(
                                    child: Text(
                                      state.isCategoryLoaded
                                          ? state.category.substring(0, 1)
                                          : '',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        color: _color.colors,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                state.category,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  );
                },
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
