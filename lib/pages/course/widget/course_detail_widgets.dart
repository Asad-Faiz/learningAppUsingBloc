import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/common/widgets/main_text_widget.dart';
import 'package:ulearning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';

import '../../../common/values/constant.dart';

// import '../../../common/routes/names.dart';
// import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widdgets.dart';
// import 'package:ulearning_app/pages/common_widgets.dart';

AppBar buildCourseDetaillAppBar() {
  return AppBar(
    title: reusableSubtitleText("Course Detail"),
    centerTitle: true,
  );
}

Widget thumbNail(String thumbNail) {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        // image: NetworkImage(
        //     "${AppConstants.SERVER_UPLOADS}${state.courseItem!.thumbnail}"),
        image: CachedNetworkImageProvider(
          "${AppConstants.SERVER_UPLOADS}${thumbNail}",
        ),
      ),
    ),
  );
}

Widget menuView() {
  return SizedBox(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: reusableSubtitleText(
              "Author Page",
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 10.sp,
            ),
          ),
        ),
        _iconAndNum('assets/icons/people.png', 0),
        _iconAndNum('assets/icons/star.png', 0),
      ],
    ),
  );
}

Widget _iconAndNum(String iconName, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconName),
          height: 20.h,
          width: 20.w,
        ),
        reusableSubtitleText(
          num.toString(),
          color: AppColors.primaryThirdElementText,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
      ],
    ),
  );
}

Widget goBuyButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    height: 60.h,
    width: 330.w,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(
        color: AppColors.primaryElement,
      ),
    ),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryElementText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget descriptionText(String description) {
  return reusableSubtitleText(
    description,
    color: AppColors.primaryThirdElementText,
    fontWeight: FontWeight.normal,
    fontSize: 11.sp,
  );
}

Widget courseSummaryTitle() {
  return reusableSubtitleText(
    "This course Includes",
    fontSize: 16.sp,
  );
}

// ntap dunction

// profile
Widget courseSummaryView(BuildContext context, CourseDetailState state) {
  var imageInfo = <String, String>{
    "${state.courseItem!.video_len ?? "0"} Hour Video": "video_detail.png",
    "Total ${state.courseItem!.lesson_num ?? "0"} Lessons": "file_detail.png",
    "${state.courseItem!.down_num ?? "0"} downloadable Resources":
        "download_detail.png",
  };
  return Column(
    children: [
      ...List.generate(
        imageInfo.length,
        (index) => GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    "assets/icons/${imageInfo.values.elementAt(index)}",
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imageInfo.keys.elementAt(index),
                  style: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget courseLessonList() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    width: 325.w,
    height: 80.h,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(225, 225, 225, 1),
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          )
        ]),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // for image and text
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.h),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/icons/Image(1).png'))),
              ),
              // column for text after the image
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  listContainer(),
                  listContainer(
                      fontSize: 10,
                      color: AppColors.primaryThirdElementText,
                      fontWeight: FontWeight.normal),
                ],
              ),
            ],
          ),
          // for Showing the Right Arrow
          Container(
            height: 24.h,
            width: 24.w,
            child: const Image(
              image: AssetImage('assets/icons/arrow_right.png'),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget listContainer(
    {double fontSize = 13,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    margin: EdgeInsets.only(left: 6.w),
    width: 200.w,
    child: Text(
      "UI Design",
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    ),
  );
}
