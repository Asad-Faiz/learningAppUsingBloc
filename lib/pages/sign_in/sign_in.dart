import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';

import '../common_widgets.dart';
import 'bloc/sign_in_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppbar("Login"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPArtyLogin(context),
                    Center(
                        child:
                            reuseableText("Use your email account to login")),
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseableText("Email"),
                          SizedBox(
                            height: 5.h,
                          ),
                          reuseableTextField(
                            'Enter Your Email Address',
                            'email',
                            "user",
                            (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          reuseableText("Password"),
                          SizedBox(
                            height: 5.h,
                          ),
                          reuseableTextField(
                            'Enter Your Password',
                            'password',
                            "lock",
                            (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLoginandReegButton("Login", "Login", () {
                      SignInController(context: context).handleSignIn("email");
                      // print("hi");
                    }),
                    buildLoginandReegButton("Register", "Register", () {
                      Navigator.pushNamed(context, '/register');
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
