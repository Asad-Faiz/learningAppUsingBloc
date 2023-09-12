import 'package:bloc/bloc.dart';
import 'package:ulearning_app/common/entities/course.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseState()) {
    on<TriggerCourse>(_triggerCourse);
  }

  _triggerCourse(TriggerCourse event, Emitter<CourseState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
