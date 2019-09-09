// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/15
// Time : 13:44

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_assistant/page/about_page.dart';
import 'package:health_assistant/page/blood_glucose_page.dart';
import 'package:health_assistant/page/blood_pressure_page.dart';
import 'package:health_assistant/page/login_page.dart';
import 'package:health_assistant/page/home_page.dart';
import 'package:health_assistant/page/weight_page.dart';

import 'bloc/bloc.dart';

class AppRoutes {
  static const String HOME_PAGE = "/"; // HomeScreen根页面必须为 /, 这样app会默认载入该页面
  static const String LOGIN_PAGE = "/login";
  static const String ABOUT_PAGE = "/about";
  static const String BLOOD_PRESSURE_PAGE = "/blood_pressure";
  static const String BLOOD_GLUCOSE_PAGE = "/blood_glucose";
  static const String WEIGHT_PAGE = "/weight";

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    HOME_PAGE: (ctx) => MultiBlocProvider(
          providers: <BlocProvider>[
            BlocProvider<TabBloc>(builder: (context) => TabBloc()),
          ],
          child: HomePage(),
        ),
    LOGIN_PAGE: (ctx) => LoginPage(),
    ABOUT_PAGE: (ctx) => AboutPage(),
    BLOOD_PRESSURE_PAGE: (ctx)=>BloodPressurePage(),
    BLOOD_GLUCOSE_PAGE: (ctx)=>BloodGlucosePage(),
    WEIGHT_PAGE: (ctx)=>WeightPage(),
  };

  static void goPageBy(String pageTag, BuildContext context) {
    Navigator.of(context).pushNamed(pageTag);
  }

  static void popGoPageBy(String pageTag, BuildContext context, {Object arg}) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(pageTag, arguments: arg);
  }
}
