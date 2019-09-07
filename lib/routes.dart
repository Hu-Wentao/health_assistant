// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/15
// Time : 13:44

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_assistant/page/about_page.dart';
import 'package:health_assistant/page/login_page.dart';
import 'package:health_assistant/page/home_page.dart';

import 'bloc/authentication/authentication_bloc.dart';

class AppRouts {
  static const String HOME_PAGE = "/"; // HomeScreen根页面必须为 /
  static const String LOGIN_PAGE = "/login";
  static const String ABOUT_PAGE = "/about";

  final Map<String, WidgetBuilder> getRouts = <String, WidgetBuilder>{
    HomePage.TAG: (ctx) => HomePage(),
    AboutPage.TAG: (ctx) => AboutPage(),
    LoginPage.TAG: (ctx, {loginBloc}) => LoginPage(loginBloc),
  };

  ///  前往登录页(携带Bloc)
  void popGoLoginPage(AuthenticationBloc loginBloc, BuildContext context) {
//  popGoPageBy(LoginPage.TAG, context, arg: loginBloc);
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => LoginPage(loginBloc)));
  }

  void goPageBy(String pageTag, BuildContext context) {
    Navigator.of(context).pushNamed(pageTag);
  }

  void popGoPageBy(String pageTag, BuildContext context, {Object arg}) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(pageTag, arguments: arg);
  }
}
