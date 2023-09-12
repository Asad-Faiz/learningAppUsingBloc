part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class HomePageDots extends HomePageEvent {
  final int index;

  HomePageDots(this.index);
}

class HomePageCourseItem extends HomePageEvent {
  final List<CourseItem> courseItem;

  HomePageCourseItem(this.courseItem);
}
