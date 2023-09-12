// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/apis/course_api.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/homepage/bloc/home_page_bloc.dart';

class HomeController {
  late BuildContext context;
  UserItem? get userProfile => Global.storageServices.getUserProfile();
  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();
  // this is a factory constructor

  // make sure you have orignaly only one instance
  factory HomeController({
    required BuildContext context,
  }) {
    _singleton.context = context;
    return _singleton;
  }
  Future<void> init() async {
    // log("This is init fucntion home_controller");

    if (Global.storageServices.getUserToken() != null) {
      // log("Chal gya chal gya home_controller");
      var result = await CourseApi.courseList();
      // log("data agya hy home_controller");
      // log("reult from home vontroller${result.toString()}");
      if (result.code == 200) {
        if (context.mounted) {
          BlocProvider.of<HomePageBloc>(context)
              .add(HomePageCourseItem(result.data!));
        }
        log("perfect");
      } else {
        log("ERROR ERROR ERRROR");
        print(" home int function =${result.code.toString()}");
      }
    } else {
      print("User Already Logged Out");
    }
  }
}
