import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/color_picker_items.dart';
import '../../create.dart';
import 'create_task_category_picker.dart';

class CreateTaskCategory extends StatelessWidget {
  const CreateTaskCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          ),
          builder: (BuildContext context) => const CreateTaskCategoryPicker(),
        );
      },
      child: BlocBuilder<CreateTaskBloc, CreateTaskState>(
        builder: (context, state) {
          final _color =
              colorPickerItems.firstWhere((e) => e.id == state.categoryTheme);
          return Container(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
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
          );
        },
      ),
    );
  }
}
