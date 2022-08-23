import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/color_picker_items.dart';
import '../../../main_screen/sidebar/sidebar.dart';
import '../../create.dart';

class CreateTaskCategoryPicker extends StatelessWidget {
  const CreateTaskCategoryPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomCategoriesItem =
        BlocProvider.of<SidebarBloc>(context).state.categories;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 2,
          color: Colors.black,
        ),
        itemCount: bottomCategoriesItem.length,
        itemBuilder: (context, index) {
          final _color = colorPickerItems
              .firstWhere((e) => e.id == bottomCategoriesItem[index].theme);
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
            child: ListTile(
              leading: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                elevation: 5.0,
                color: _color.colors,
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      bottomCategoriesItem[index].name.substring(0, 1),
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
                bottomCategoriesItem[index].name,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
               BlocProvider.of<CreateTaskBloc>(context).add(CreateTaskCategoryChanged(
                      category: bottomCategoriesItem[index].name,
                      categoryTheme: bottomCategoriesItem[index].theme,
                    ));
                Navigator.of(context).pop();
              },
            ),
          );
        },
      ),
    );
  }
}
