import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../data/meeting/meeting_data_source.dart';
import '../calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Schedule',
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<CalendarViewBloc, CalendarViewState>(
                builder: (context, state) {
                  return SfCalendar(
                    view: CalendarView.month,
                    dataSource: MeetingDataSource(state.meetings),
                    showDatePickerButton: true,
                    minDate: DateTime(2020, 01, 01, 07, 0, 0),
                    allowedViews: const <CalendarView>[
                      CalendarView.day,
                      CalendarView.week,
                      CalendarView.workWeek,
                      CalendarView.month,
                    ],
                    monthViewSettings: const MonthViewSettings(
                      dayFormat: 'EEE',
                      navigationDirection: MonthNavigationDirection.horizontal,
                      showAgenda: true,
                      agendaItemHeight: 70,
                    ),
                    timeSlotViewSettings: const TimeSlotViewSettings(
                      dayFormat: 'EEE',
                      timeIntervalHeight: 75,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
