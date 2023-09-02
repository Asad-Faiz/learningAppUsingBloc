import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/homepage/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/homepage/widgets/home_page_widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homepageText(
                  "Hello",
                  color: AppColors.primaryThirdElementText,
                  top: 20,
                ),
                homepageText(
                  "Asad",
                  color: AppColors.primaryText,
                  top: 5,
                ),
                searchView(),
                // homepageText("asad"),
                slidersView(context, state),
                menuView(),
              ],
            ),
          );
        },
      ),
    );
  }
}