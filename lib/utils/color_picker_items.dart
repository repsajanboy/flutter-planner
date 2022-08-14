import 'package:flutter/material.dart';

class ColorPickerItem {
  final int id;
  final Color? colors;

  ColorPickerItem({required this.id, this.colors});
}

List<ColorPickerItem> colorPickerItems = [
  ColorPickerItem(id: 0, colors: Colors.blue),
  ColorPickerItem(id: 1, colors: Colors.green),
  ColorPickerItem(id: 2, colors: Colors.indigo),
  ColorPickerItem(id: 3, colors: Colors.deepOrange),
  ColorPickerItem(id: 4, colors: Colors.pink),
  ColorPickerItem(id: 5, colors: Colors.purple),
  ColorPickerItem(id: 6, colors: Colors.red),
  ColorPickerItem(id: 7, colors: Colors.teal),
];
