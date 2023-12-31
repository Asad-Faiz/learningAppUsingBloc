// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app/common/apis/course_api.dart';
import 'package:ulearning_app/common/entities/course.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({
    required this.context,
  });

  void init() async {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    // log(args['id'].toString());
    asyncLoadAllData(args['id']);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        print("Context not available (course_Detail_Controller)");
      }
    } else {
      toastInfo(msg: "Something Went Wrong");
      print(
          '---------------Error Code ${result.code} (course_Detail_Controller)---------------');
    }
  }

  void goBuy(int? id) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);
      log("my returned sripe url ${url}");
    } else {
      log("Failed payment");
    }
  }
}
