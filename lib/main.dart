// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_app/common/routes/route.dart';
import 'package:ulearning_app/global.dart';

import 'common/values/color.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      // providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            iconTheme: const IconThemeData(color: AppColors.primaryText),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // home: const ApplicationPage(),
          // home: const Welcome(),
          // initialRoute: '/',
          // routes: {
          //   '/homePage': (context) => const Homepage(),
          //   '/signIn': (context) => const SignIn(),
          //   '/register': (context) => const Register(),
          // },
        ),
      ),
    );
  }
}
