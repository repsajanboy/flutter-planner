import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/color_picker_items.dart';
import '../../category.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 4 : 8,
          crossAxisSpacing: isPortrait ? 8.0 : 20.0,
          mainAxisSpacing: isPortrait ? 8.0 : 1,
        ),
        itemCount: colorPickerItems.length,
        itemBuilder: (context, index) {
          return BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              final currentIndex = colorPickerItems
                  .indexWhere((e) => e.id == state.selectedTheme);
              return InkWell(
                onTap: () {
                  context
                      .read<CategoryBloc>()
                      .add(CategoryColorChanged(index: index));
                },
                child: Container(
                  width: 50,
                  height: 50,
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
            },
          );
        },
      ),
    );
  }
}
