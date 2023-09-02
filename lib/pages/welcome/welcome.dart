import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/welcome/widget/custom_page_widget.dart';
// import 'package:ulearning_app/pages/homepage/homepage.dart';

import 'bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context)
                          .add(onPageChangeEvent());
                      log(index.toString());
                    },
                    children: [
                      CustomPageWidget(
                        buttonName: "Next",
                        imagePath: "assets/images/reading.png",
                        pageController: pageController,
                        index: 1,
                        subTitle:
                            'Forget about a for paper all knowlegde in on learning!',
                        title: "First See Learning",
                        context: context,
                      ),
                      CustomPageWidget(
                        buttonName: "Next",
                        imagePath: "assets/images/boy.png",
                        pageController: pageController,
                        index: 2,
                        subTitle:
                            'Forget about a for paper all knowlegde in on learning!',
                        title: "First See Learning",
                        context: context,
                      ),
                      CustomPageWidget(
                        buttonName: "Get Started",
                        imagePath: "assets/images/man.png",
                        pageController: pageController,
                        index: 3,
                        subTitle:
                            "Anywhere, anytime. The time is at your discretion so study whenever you want",
                        title: "Always Fascinated Learning",
                        context: context,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 40.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(20.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
