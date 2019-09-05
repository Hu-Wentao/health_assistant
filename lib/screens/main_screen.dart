// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/13
// Time : 15:59

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_assistant/bloc/bloc.dart';
import 'package:health_assistant/bloc/authentication_bloc.dart';
import 'package:health_assistant/common/user.dart';
import 'package:health_assistant/screens/about_screen.dart';
import 'package:health_assistant/routes.dart';

part 'main_screen_drawer.dart';



class MainPage extends StatelessWidget {
  static const TAG = "/MainPage";
  @override
  Widget build(BuildContext context) {
//    final ConnectBloc _connectBloc = BlocProvider.of<ConnectBloc>(context);
//    final DeviceBloc _deviceBloc = BlocProvider.of<DeviceBloc>(context);
    final AuthenticationBloc _loginBloc = BlocProvider.of<AuthenticationBloc>(context);
//    final OadBloc _oadBloc = BlocProvider.of<OadBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("健康助手"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => goPageBy(AboutPage.TAG, context)),
        ],
      ),
      drawer: _buildDrawer(context, _loginBloc,),

    );
  }

}

  ///
  /// 布局 ---------------------------------------------------------------------
  /// 布局 ---------------------------------------------------------------------
  ///
