import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/common/widgets/main_text_widget.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 20.w,
            height: 15.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          reusableSubtitleText("Profile"),
          SizedBox(
            width: 30.w,
            height: 20.h,
            child: Image.asset(
              "assets/icons/more-vertical.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    ),
  );
}

// profile Icon and edit button
Widget profileIconAndEditButon() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    child: Image(
        height: 25.h,
        width: 25.w,
        image: const AssetImage("assets/icons/edit_3.png")),
  );
}

var imageInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achivement": "award.png",
  "Love": "heart(1).png",
  "Remainders": "cube.png",
};

// ntap dunction

// profile
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imageInfo.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.SETTINGPAGE);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                      "assets/icons/${imageInfo.values.elementAt(index)}"),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imageInfo.keys.elementAt(index),
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
