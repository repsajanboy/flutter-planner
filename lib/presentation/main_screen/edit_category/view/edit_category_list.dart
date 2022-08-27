import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/category/category.dart';
import '../../../../utils/color_picker_items.dart';
import '../../../../utils/context_extension.dart';
import '../edit.dart';
import 'widgets/edit_category_bottom_sheet.dart';

class EditCategoryList extends StatelessWidget {
  const EditCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          'Manage Category',
          style: context.typo.editCategoryTitleAppBarStyle(),
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.grey[850],
        ),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<EditCategoryBloc, EditCategoryState>(
                builder: (context, state) {
                  if (state is EditCategoryListState) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(height: 2, color: Colors.white54),
                        itemCount: state.categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _categoriesItem(
                            context,
                            state.categories[index],
                            index,
                          );
                        });
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _categoriesItem(
    BuildContext context,
    Category category,
    int index,
  ) {
    final _color = colorPickerItems.firstWhere((e) => e.id == category.theme);
    return ListTile(
        contentPadding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
        leading: SizedBox(
          width: 50.0,
          height: 30.0,
          child: Row(
            children: [
              Container(
                width: 10.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  color: _color.colors,
                ),
              ),
              Container(
                width: 40.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  color: _color.colors!.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),
        title: Text(
          category.name,
          style: context.typo.categoryListTitleStyle(),
        ),
        trailing: IconButton(
            onPressed: () {
              BlocProvider.of<EditCategoryBloc>(context).add(EditCategoryDataLoaded(category: category));
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.0))),
                builder: (BuildContext context) =>
                    const EditCategoryBottomSheet(),
              );
            },
            icon: const Icon(
              Icons.drag_handle_rounded,
              color: Colors.white70,
            )));
  }
}
