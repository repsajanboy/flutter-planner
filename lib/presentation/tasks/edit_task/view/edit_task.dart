import 'package:flutter/material.dart';

import '../../../../utils/context_extension.dart';
import 'widgets/edit_task_category.dart';
import 'widgets/edit_task_date_picker.dart';
import 'widgets/edit_task_name_form.dart';
import 'widgets/edit_task_time_picker.dart';

class EditTask extends StatelessWidget {
  const EditTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
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
                    onPressed: () {},
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
    );
  }
}
