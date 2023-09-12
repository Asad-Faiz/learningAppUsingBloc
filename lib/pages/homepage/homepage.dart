import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/homepage/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/homepage/home_controller.dart';
import 'package:ulearning_app/pages/homepage/widgets/home_page_widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // late HomeController _homeController;
  late UserItem? userProfile;
  @override
  void initState() {
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
    // userProfile = HomeController(context: context).userProfile;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;

    print("homepage ${userProfile!.avatar}");
  }

  @override
  Widget build(BuildContext context) {
    // log(_homeController.userProfile.avatar!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(userProfile!.avatar!),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if ((state as HomePageInitial).courseItem.isEmpty) {
            HomeController(context: context).init();
          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                SliverToBoxAdapter(
                  child: homepageText(
                    "Hello",
                    color: AppColors.primaryThirdElementText,
                    top: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homepageText(
                    userProfile?.name ?? '',
                    color: AppColors.primaryText,
                    top: 5,
                  ),
                ),
                SliverToBoxAdapter(
                  child: searchView(),
                ),

                // homepageText("asad"),
                SliverToBoxAdapter(
                  child: slidersView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: (state).courseItem.length,
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // COURSE GRID
                          Navigator.of(context)
                              .pushNamed(AppRoutes.COURSE_DETAIL, arguments: {
                            'id': state.courseItem.elementAt(index).id,
                          });
                          log(state.courseItem.elementAt(index).id.toString());
                        },
                        child: courseGrid((state).courseItem[index]),
                      );
                    }),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
