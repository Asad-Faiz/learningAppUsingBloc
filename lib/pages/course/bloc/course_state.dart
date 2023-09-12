part of 'course_bloc.dart';

class CourseState {
  final CourseItem? courseItem;

  CourseState({this.courseItem});
  CourseState copyWith({CourseItem? courseItem}) {
    return CourseState(courseItem: courseItem ?? this.courseItem);
  }
}
