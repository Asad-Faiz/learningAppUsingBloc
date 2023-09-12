part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {
  final int index;
  final List<CourseItem> courseItem;

  HomePageInitial({
    this.courseItem = const <CourseItem>[],
    this.index = 0,
  });

  HomePageInitial copyWith(int? index, List<CourseItem>? courseItem) {
    return HomePageInitial(
        index: index ?? this.index, courseItem: courseItem ?? this.courseItem);
  }
}
