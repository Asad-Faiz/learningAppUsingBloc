import 'package:bloc/bloc.dart';
import 'package:ulearning_app/common/entities/course.dart';

part 'course_detail_event.dart';
part 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(CourseDetailState()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

  _triggerCourseDetail(
      TriggerCourseDetail event, Emitter<CourseDetailState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
