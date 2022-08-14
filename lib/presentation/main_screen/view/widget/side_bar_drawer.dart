import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../category/category.dart';
import 'color_picker.dart';

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
                builder: (BuildContext context) {
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
                        children: [
                          TextFormField(
                            cursorColor: Colors.white70,
                            style: const TextStyle(color: Colors.white70),
                            decoration: const InputDecoration(
                              hintText: 'Category Name',
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Expanded(
                              child: BlocProvider(
                            create: (context) => CategoryBloc()..add(CategoryColorChanged(index: 0)),
                            child: const ColorPicker(),
                          )),
                          const SizedBox(
                            height: 25.0,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Cancel'.toUpperCase()),
                                ),
                                const VerticalDivider(
                                  color: Colors.white24,
                                  thickness: 1.5,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Save'.toUpperCase()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
