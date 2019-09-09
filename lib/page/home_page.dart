// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/13
// Time : 15:59

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_assistant/bloc/bloc.dart';
import 'package:health_assistant/models/app_tab.dart';
import 'package:health_assistant/screens/check_screen.dart';
import 'package:health_assistant/screens/community_screen.dart';
import 'package:health_assistant/screens/my_screen.dart';
import 'package:health_assistant/widget/tab_selector.dart';

class HomePage extends StatelessWidget {
  static const TAG = "HomePage";

  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Stack(children: <Widget>[
          Scaffold(body: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80),
              child: buildBodyBy(activeTab))),
          Positioned(
            bottom: 0,
            child: TabSelector(
              activeTab: activeTab,
              onTabSelected: (tab) => tabBloc.dispatch(UpdateTab(tab)),
            ),
          ),
        ]);
      },
    );
  }

  Widget buildBodyBy(AppTab activeTab) {
    print('HomePage.buildBodyBy # 页面选择$activeTab');
    switch (activeTab) {
      case AppTab.CHECK:
        return CheckScreen();
      case AppTab.COMMUNITY:
        return CommunityScreen();
      case AppTab.MY:
        return MyScreen();
    }
    throw "页面缺失 或 参数异常！";
  }
}
