import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/color_picker_items.dart';
import '../../edit.dart';

class EditCategoryColorPicker extends StatelessWidget {
  const EditCategoryColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: colorPickerItems.length,
        itemBuilder: (context, index) {
          return BlocBuilder<EditCategoryBloc, EditCategoryState>(
            builder: (context, state) {
              if (state is EditSingleCategoryState) {
                final currentIndex = colorPickerItems
                    .indexWhere((e) => e.id == state.theme);
                return InkWell(
                  onTap: () {
                    context.read<EditCategoryBloc>().add(EditCategoryColorChanged(index: index));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorPickerItems[index].colors,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 45.0,
                      color: currentIndex == index
                          ? Colors.white
                          : colorPickerItems[index].colors,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
