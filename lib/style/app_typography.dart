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
      fontSize: 16.0,
    );
  }

  TextStyle createTaskLabel() {
    return const TextStyle(fontSize: 16.0, color: Colors.black38);
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

  TextStyle fabTextStyle() {
    return const TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 20.0,
    );
  }

  TextStyle categoryNameTextStyle() {
    return const TextStyle(
      fontFamily: 'Nunito',
      color: Colors.white70,
    );
  }

  TextStyle categoryNameHintStyle() {
    return const TextStyle(
      fontFamily: 'Nunito',
      color: Colors.white70,
    );
  }

  TextStyle createUpdateButtonStyle() {
    return const TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 16.0,
      letterSpacing: 1.5,
    );
  }
}
