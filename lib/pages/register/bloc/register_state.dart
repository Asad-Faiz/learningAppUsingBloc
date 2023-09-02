part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {
  final String userName;
  final String email;
  final String password;
  final String repassword;
  RegisterInitial(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.repassword = ""});
  RegisterInitial copyWith(
      {String? userName, String? email, String? password, String? repassword}) {
    return RegisterInitial(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        repassword: repassword ?? this.repassword);
  }
}
