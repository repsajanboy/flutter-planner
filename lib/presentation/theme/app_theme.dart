import 'package:flutter/material.dart';

enum AppTheme {
  blue,
  green,
  indigo,
  orange,
  pink,
  purple,
  red,
  teal,
}

final appThemeData = {
  AppTheme.blue: ThemeData(
    primarySwatch: Colors.blue,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Beneth',
            fontSize: 48.0,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  AppTheme.green: ThemeData(
    primarySwatch: Colors.green,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Beneth',
            fontSize: 48.0,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  AppTheme.indigo: ThemeData(
    primarySwatch: Colors.indigo,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Beneth',
            fontSize: 48.0,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  AppTheme.orange: ThemeData(
    primarySwatch: Colors.deepOrange,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Beneth',
            fontSize: 48.0,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  AppTheme.pink: ThemeData(
    primarySwatch: Colors.pink,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Beneth',
            fontSize: 48.0,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  AppTheme.purple: ThemeData(
    primarySwatch: Colors.purple,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Beneth',
            fontSize: 48.0,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  AppTheme.red: ThemeData(
    primarySwatch: Colors.red,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Beneth',
            fontSize: 48.0,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  AppTheme.teal: ThemeData(
    primarySwatch: Colors.teal,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Beneth',
            fontSize: 48.0,
          ),
          bodyMedium: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
  )
};
