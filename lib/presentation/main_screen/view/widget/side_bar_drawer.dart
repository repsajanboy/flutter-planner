import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/category_repository.dart';
import '../../../../utils/context_extension.dart';
import '../../category/category.dart';
import '../../category/view/category_botttom_sheet.dart';
import '../../category/view/widget/color_picker.dart';

class SideBarDrawer extends StatelessWidget {
  const SideBarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: ListView(
        children: [
          ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFBF5AF2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'W',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: const Text(
              'Work',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFF9F0A),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'F',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: const Text(
              'Family',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0A84FF),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'S',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: const Text(
              'Special',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ListTile(
            leading: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFF375F),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'P',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: const Text(
              'Personal',
              style: TextStyle(color: Colors.white70),
            ),
          ),
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
                builder: (BuildContext context) => const CategoryBottomSheet(),
              );
            },
          )
        ],
      ),
    );
  }
}
