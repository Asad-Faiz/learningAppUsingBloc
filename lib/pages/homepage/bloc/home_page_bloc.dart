import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ulearning_app/common/entities/course.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageDots>((event, emit) {
      emit((state as HomePageInitial).copyWith(event.index, []));
    });
    on<HomePageCourseItem>(
      (event, emit) {
        emit((state as HomePageInitial).copyWith(0, event.courseItem));
      },
    );
  }
}
