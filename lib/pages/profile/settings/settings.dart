import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/homepage/bloc/home_page_bloc.dart';
import 'package:ulearning_app/pages/homepage/home_controller.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/widgets/setting_widgets.dart';

import '../../application/bloc/app_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void removeUserData() {
    BlocProvider.of<AppBloc>(context).add(const TriggerAppEvent(0));
    BlocProvider.of<HomePageBloc>(context).add(HomePageDots(0));
    Global.storageServices.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageServices.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingAppbar(),
      body:
          SingleChildScrollView(child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Container(
              child: Column(
            children: [
              settingButton(context, removeUserData),
            ],
          ));
        },
      )),
    );
  }
}
