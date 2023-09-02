part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {
  final String email;
  final String password;

  SignInInitial({this.email = '', this.password = ''});
  SignInInitial copyWith({String? email, String? password}) {
    return SignInInitial(
        email: email ?? this.email, password: password ?? this.password);
  }
}
