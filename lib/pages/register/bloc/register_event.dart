part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class UserNameEvent extends RegisterEvent {
  final String userName;

  UserNameEvent(this.userName);
}

class EmailEvent extends RegisterEvent {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent {
  final String password;

  PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvent {
  final String repassword;

  RePasswordEvent(this.repassword);
}
