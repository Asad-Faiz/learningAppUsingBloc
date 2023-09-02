import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitialState()) {
    on<TrigerSettingsEvent>(_triggerSetting);
  }
  _triggerSetting(TrigerSettingsEvent event, Emitter<SettingsState> emit) {
    emit(SettingsInitialState());
  }
}
