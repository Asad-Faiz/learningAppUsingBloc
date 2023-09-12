// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app/common/apis/user_api.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/homepage/home_controller.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

import '../../common/values/constant.dart';
import '../../global.dart';

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
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            // setting all data to LoginRequestEntity model
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();

            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.type = 1;

            // TYPW ` MEANS EMAIL LOGIN

            await asyncpostAllData(loginRequestEntity);
            // Global.storageServices
            //     .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            // Navigator.pushNamedAndRemoveUntil(
            //     context, '/application', (route) => false);
            // return;

            if (context.mounted) {
              await HomeController(context: context).init();
            }
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

  // SENDING ALL DTAA TO BACKEND
  Future<void> asyncpostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserApi.login(param: loginRequestEntity);
    if (result.code == 200) {
      try {
        await Global.storageServices.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));

        // use for authorization
        await Global.storageServices.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        // log("profile key ${AppConstants.STORAGE_USER_TOKEN_KEY.toString()}");
        log("acess_Token from SIgnin Controller ${result.data!.access_token!}");
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/application', (route) => false);
        }
      } catch (e) {
        print("Saiving local Storage Error${e.toString()}");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "Unknown Error");
    }
  }
}
