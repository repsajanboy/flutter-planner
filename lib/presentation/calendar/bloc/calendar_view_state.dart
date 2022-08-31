part of 'calendar_view_bloc.dart';

class CalendarViewState extends Equatable {
  final List<Meeting> meetings;
  const CalendarViewState({
    this.meetings = const <Meeting>[],
  });

  CalendarViewState copyWith({
    List<Meeting>? meetings,
  }) {
    return CalendarViewState(meetings: meetings ?? this.meetings);
  }

  @override
  List<Object> get props => [meetings];
}

class CalendarViewInitial extends CalendarViewState {}
