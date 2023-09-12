// import 'dart:developer';

import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/utils/http_utils.dart';

import '../entities/course.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    // log("response agya course_api");
    // print("response coming from cource_api ${response.toString()}");
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/courseDetail', queryParameters: params?.toJson());
    // log("response agya course_api");
    print(
        "response coming from cource_api courseResult() ${response.toString()}");
    return CourseDetailResponseEntity.fromJson(response);
  }

  // for pay
  static Future<BaseResponseEntity> coursePay(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/checkout', queryParameters: params?.toJson());
    return BaseResponseEntity.fromJson(response);
  }
}
