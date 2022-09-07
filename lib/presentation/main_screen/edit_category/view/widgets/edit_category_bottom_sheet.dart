import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/context_extension.dart';
import '../../../../tasks/tasks.dart';
import '../../../../theme/theme.dart';
import '../../../sidebar/bloc/sidebar_bloc.dart';
import '../../edit.dart';
import 'edit_category_color_picker.dart';

class EditCategoryBottomSheet extends StatelessWidget {
  const EditCategoryBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        height: MediaQuery.of(context).size.height * .48,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edit category',
                  style: context.typo.createUpdateCategoryLabelStyle(),
                ),
                BlocBuilder<EditCategoryBloc, EditCategoryState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.white70,
                        size: 32.0,
                      ),
                      onPressed: () {
                        context
                            .read<EditCategoryBloc>()
                            .add(DeleteCategorySelected(id: state.id));
                        BlocProvider.of<SidebarBloc>(context)
                            .add(CategoriesFetched());
                        BlocProvider.of<SidebarBloc>(context)
                            .add(CategoriesIndexSelected(index: 0));
                        BlocProvider.of<TasksBloc>(context).add(TasksFetched());
                        BlocProvider.of<TasksBloc>(context)
                            .add(TasksWithNoCategoriesLoaded());
                        Navigator.pop(context, 'Done');
                      },
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<EditCategoryBloc, EditCategoryState>(
              builder: (context, state) {
                return TextFormField(
                  cursorColor: Colors.white70,
                  initialValue: state.name,
                  style: context.typo.categoryNameTextStyle(),
                  decoration: InputDecoration(
                    hintText: 'Category Name',
                    hintStyle: context.typo.categoryNameHintStyle(),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                  ),
                  onChanged: (value) {
                    context
                        .read<EditCategoryBloc>()
                        .add(EditCategoryNameChanged(name: value));
                  },
                );
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Expanded(
              child: EditCategoryColorPicker(),
            ),
            BlocBuilder<EditCategoryBloc, EditCategoryState>(
              builder: (context, state) {
                return IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                        },
                        child: Text(
                          'Cancel'.toUpperCase(),
                          style: context.typo.popUpButtonStyle(),
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.white24,
                        thickness: 1.5,
                      ),
                      TextButton(
                        onPressed: () async {
                          context
                              .read<EditCategoryBloc>()
                              .add(EditCategorySaved());
                          BlocProvider.of<SidebarBloc>(context)
                              .add(CategoriesFetched());
                          BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
                              theme: AppTheme.values[state.theme]));
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Save'.toUpperCase(),
                          style: context.typo.popUpButtonStyle(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
