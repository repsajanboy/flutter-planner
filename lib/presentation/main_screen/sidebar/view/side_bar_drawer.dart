import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/category/category.dart';
import '../../../../repositories/category_repository.dart';
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
            // ListTile(
            //   leading: Container(
            //     decoration: const BoxDecoration(
            //       color: Color(0xFFFF9F0A),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     padding: const EdgeInsets.all(10.0),
            //     child: const Text(
            //       'F',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            //   title: const Text(
            //     'Family',
            //     style: TextStyle(color: Colors.white70),
            //   ),
            // ),
            // ListTile(
            //   leading: Container(
            //     decoration: const BoxDecoration(
            //       color: Color(0xFF0A84FF),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     padding: const EdgeInsets.all(10.0),
            //     child: const Text(
            //       'S',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            //   title: const Text(
            //     'Special',
            //     style: TextStyle(color: Colors.white70),
            //   ),
            // ),
            // ListTile(
            //   leading: Container(
            //     decoration: const BoxDecoration(
            //       color: Color(0xFFFF375F),
            //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     ),
            //     padding: const EdgeInsets.all(10.0),
            //     child: const Text(
            //       'P',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            //   title: const Text(
            //     'Personal',
            //     style: TextStyle(color: Colors.white70),
            //   ),
            // ),
            ListTile(
              leading: const Icon(
                Icons.add,
                color: Colors.white70,
              ),
              title: const Text(
                'Add Category',
                style: TextStyle(color: Colors.white70),
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
    );
  }

  Widget _categoriesItem(BuildContext context, Category category) {
    return ListTile(
      leading: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFBF5AF2),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          category.name.substring(0, 1),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        category.name,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
