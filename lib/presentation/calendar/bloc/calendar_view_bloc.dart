import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/meeting/meeting.dart';
import '../../../repositories/category_repository.dart';
import '../../../repositories/task_repository.dart';
import '../../../utils/color_picker_items.dart';

part 'calendar_view_event.dart';
part 'calendar_view_state.dart';

class CalendarViewBloc extends Bloc<CalendarViewEvent, CalendarViewState> {
  CalendarViewBloc({
    required this.taskRepository,
    required this.categoryRepository,
  }) : super(CalendarViewInitial()) {
    on<CalendarMeetingLoaded>(_calendarMeetingLoaded);
  }

  final TaskRepository taskRepository;
  final CategoryRepository categoryRepository;

  Future<void> _calendarMeetingLoaded(
    CalendarMeetingLoaded event,
    Emitter<CalendarViewState> emit,
  ) async {
    final tasks = await taskRepository.fetchTasks();
    final categories = await categoryRepository.fetchCategories();
    final List<Meeting> meetings = [];
    for (var e in tasks) {
      final categoryTheme = categories.isNotEmpty ? categories.firstWhere((a) => a.id == e.categoryId).theme : 0;
      meetings.add(
        Meeting(
          eventName: e.title,
          startTime: e.startTime,
          endTime: e.endTime,
          theme:  colorPickerItems.firstWhere((b) => b.id == categoryTheme).colors!,
        ),
      );
    }

    emit(state.copyWith(meetings: meetings));
  }
}
