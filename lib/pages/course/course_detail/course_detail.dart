import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';
// import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/course/widget/course_detail_widgets.dart';

import '../../../common/widgets/main_text_widget.dart';
import 'course_detail_controller.dart';
// import 'package:ulearning_app/pages/homepage/widgets/home_page_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
    // var data = ModalRoute.of(context)!.settings.arguments as Map;
    // print(data.values);
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      builder: (context, state) {
        // log('--my item ${state.courseItem!.description.toString()}');
        log('state is alled ${++i} times');
        return state.courseItem == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.white,
                child: SafeArea(
                  child: Scaffold(
                    appBar: buildCourseDetaillAppBar(),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 25.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // first Image
                                thumbNail(
                                    state.courseItem!.thumbnail.toString()),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // 3 menu buttons
                                menuView(),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // Corse Description Title
                                reusableSubtitleText("Course Description"),
                                // Course Description Text
                                descriptionText(
                                    state.courseItem!.description.toString()),
                                //  go Buy Button
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _courseDetailController
                                        .goBuy(state.courseItem!.id);
                                  },
                                  child: goBuyButton("Go Buy"),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                //Course Summmary title
                                courseSummaryTitle(),
                                // course summary in list
                                courseSummaryView(context, state),
                                SizedBox(
                                  height: 20.h,
                                ),
                                reusableSubtitleText("Lesson List"),
                                SizedBox(
                                  height: 10.h,
                                ),
                                courseLessonList(),
                                SizedBox(
                                  height: 20.h,
                                )
                              ],
                            ),
                          ),
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
