import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_bloc.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

import '../common_widgets.dart';
// import '../sign_in/sign_in_controller.dart';
// import '../sign_in/widgets/sign_in_widdgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppbar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // buildThirdPArtyLogin(context),
                    Center(
                      child: reuseableText(
                          "Enter ypur details below & free sign up"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseableText("Username"),
                          reuseableTextField(
                            'Enter Your User Name',
                            'name',
                            "user",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UserNameEvent(value));
                            },
                          ),
                          reuseableText("Email"),
                          reuseableTextField(
                            'Enter Your Email Address',
                            'email',
                            "user",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
                            },
                          ),
                          reuseableText("Password"),
                          reuseableTextField(
                            'Enter Your Password',
                            'password',
                            "lock",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reuseableText("Re-Enter"),
                          reuseableTextField(
                            'Re-Enter Your Password',
                            'password',
                            "lock",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(RePasswordEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    // forgotPassword(),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reuseableText(
                          "By Creating an account you have to agree with our term & condition."),
                    ),

                    buildLoginandReegButton("Sign up", "Login", () {
                      RegisterController(context: context)
                          .handleEmailRegister();
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
