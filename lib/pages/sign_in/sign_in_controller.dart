// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({
    required this.context,
  });
  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state =
            BlocProvider.of<SignInBloc>(context).state as SignInInitial;
        // final state = context.read<SignInBloc>().state as SignInInitial;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "Enter Email Address");
        }
        if (password.isEmpty) {
          toastInfo(msg: "Enter Password");
        }

        try {
          log(emailAddress);
          log(password);
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            toastInfo(msg: "You dont Exsist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify Email ");
            return;
          }
          var user = credential.user;
          if (user != null) {
            Global.storageServices
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.pushNamedAndRemoveUntil(
                context, '/application', (route) => false);
            return;
          } else {
            toastInfo(msg: "You are not user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for this email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Enter Correct Password");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
