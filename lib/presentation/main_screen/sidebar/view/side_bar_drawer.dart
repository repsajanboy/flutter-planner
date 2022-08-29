import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/category/category.dart';
import '../../../../routing/app_router_names.dart';
import '../../../../utils/color_picker_items.dart';
import '../../../../utils/context_extension.dart';
import '../../../tasks/tasks.dart';
import '../../../theme/theme.dart';
import '../../category/category.dart';
import '../../edit_category/edit.dart';
import '../sidebar.dart';

class SideBarDrawer extends StatelessWidget {
  const SideBarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<SidebarBloc, SidebarState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case SideBarStatus.success:
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: state.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              final selectedIndex =
                                  state.selectedIndex == index;
                              return _categoriesItem(
                                context,
                                state.categories[index],
                                selectedIndex,
                                index,
                              );
                            },
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                  ListTile(
                    leading: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      elevation: 5.0,
                      color: Colors.grey[800],
                      child: const SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    title: const Text(
                      'Add Category',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.0))),
                        builder: (BuildContext context) =>
                            const CategoryBottomSheet(),
                      ).whenComplete(() {
                        BlocProvider.of<SidebarBloc>(context).add(CategoriesFetched());
                      });
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ListTile(
                  leading: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    elevation: 5.0,
                    color: Colors.grey[800],
                    child: const SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Center(
                        child: Icon(
                          Icons.settings_outlined,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  title: const Text(
                    'Manage',
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<EditCategoryBloc>(context)
                        .add(EditCategoryListLoaded());
                    Navigator.pushNamed(context, RouteNames.editCategory);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoriesItem(
    BuildContext context,
    Category category,
    bool selectedIndex,
    int index,
  ) {
    final _color = colorPickerItems.firstWhere((e) => e.id == category.theme);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          elevation: 5.0,
          color: selectedIndex ? _color.colors : Colors.grey[800],
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: Center(
              child: Text(
                category.name.substring(0, 1),
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  color: selectedIndex ? Colors.white70 : _color.colors,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          category.name,
          style: context.typo.categoryListTitleStyle(),
        ),
        trailing: selectedIndex
            ? CircleAvatar(
                backgroundColor: _color.colors,
                radius: 8.0,
              )
            : null,
        onTap: () {
          BlocProvider.of<SidebarBloc>(context)
              .add(CategoriesIndexSelected(index: index));
          BlocProvider.of<ThemeBloc>(context)
              .add(ThemeChanged(theme: AppTheme.values[category.theme]));
          BlocProvider.of<SidebarBloc>(context)
              .add(CategoriesNameSelected(selectedCategoryName: category.name));
          BlocProvider.of<TasksBloc>(context)
              .add(TasksListFiltered(categoryId: category.id));
        },
      ),
    );
  }
}
