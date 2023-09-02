part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {
  final int index;

  AppInitial({this.index = 0});
}
