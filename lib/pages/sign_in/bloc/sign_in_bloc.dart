import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<EmailEvent>((event, emit) {
      emit((state as SignInInitial).copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      emit((state as SignInInitial).copyWith(password: event.password));
    });
  }
}
