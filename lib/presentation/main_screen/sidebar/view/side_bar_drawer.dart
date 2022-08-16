import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/category/category.dart';
import '../../../../repositories/category_repository.dart';
import '../../../../utils/color_picker_items.dart';
import '../../category/category.dart';
import '../sidebar.dart';

class SideBarDrawer extends StatelessWidget {
  const SideBarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SidebarBloc(
        categoryRepository: context.read<CategoryRepository>(),
      )..add(CategoriesFetched()),
      child: Drawer(
        backgroundColor: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
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
                          return _categoriesItem(
                              context, state.categories[index]);
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
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0))),
                    builder: (BuildContext context) =>
                        const CategoryBottomSheet(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoriesItem(BuildContext context, Category category) {
    final _color = colorPickerItems.firstWhere((e) => e.id == category.theme);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          elevation: 5.0,
          color: Colors.grey[800],
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: Center(
              child: Text(
                category.name.substring(0, 1),
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
        title: Text(
          category.name,
          style: const TextStyle(
            color: Colors.white70,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
