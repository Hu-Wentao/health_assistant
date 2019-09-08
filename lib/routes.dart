// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/15
// Time : 13:44

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_assistant/page/about_page.dart';
import 'package:health_assistant/page/login_page.dart';
import 'package:health_assistant/page/home_page.dart';

import 'bloc/bloc.dart';

class AppRouts {
  static const String HOME_PAGE = "/"; // HomeScreen根页面必须为 /
  static const String LOGIN_PAGE = "/login";
  static const String ABOUT_PAGE = "/about";

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    HOME_PAGE: (ctx) => MultiBlocProvider(
          providers: <BlocProvider>[
            BlocProvider<TabBloc>(builder: (context) => TabBloc()),
          ],
          child: HomePage(),
        ),
    LOGIN_PAGE: (ctx) => LoginPage(),
    ABOUT_PAGE: (ctx) => AboutPage(),
  };

  static void goPageBy(String pageTag, BuildContext context) {
    Navigator.of(context).pushNamed(pageTag);
  }

  static void popGoPageBy(String pageTag, BuildContext context, {Object arg}) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(pageTag, arguments: arg);
  }
}
