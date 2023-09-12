import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';

import '../../common/widgets/flutter_toast.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  void handleEmailRegister() async {
    final state =
        BlocProvider.of<RegisterBloc>(context).state as RegisterInitial;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String repassword = state.repassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Enter User Name");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Enter Email");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Enter password");
      return;
    }
    if (repassword.isEmpty) {
      toastInfo(msg: "Re-Enter password");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: "Verification Email has been sent. Check your inbox");

        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "password s to weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "Email is already in use");
      }
    }
  }
}
