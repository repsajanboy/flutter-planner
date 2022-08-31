import 'package:flutter/material.dart';

class Meeting {
  String eventName;
  DateTime startTime;
  DateTime endTime;
  Color theme;

  Meeting({
    required this.eventName,
    required this.startTime,
    required this.endTime,
    required this.theme,
  });
}
