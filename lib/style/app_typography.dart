import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle subText54() {
    return const TextStyle(
      color: Colors.black54,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle subTitle54() {
    return const TextStyle(
        fontFamily: 'Open Sans',
        color: Colors.black54,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5);
  }

  TextStyle createTaskText() {
    return const TextStyle(
      fontSize: 18.0,
    );
  }

  TextStyle taskNameHintStyle() {
    return TextStyle(
      fontFamily: 'Nunito',
      color: Colors.grey[400],
      fontWeight: FontWeight.normal,
      fontSize: 20.0,
    );
  }

  TextStyle taskNameStyle() {
    return const TextStyle(
      fontFamily: 'Nunito',
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    );
  }
}
