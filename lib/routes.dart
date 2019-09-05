// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/15
// Time : 13:44

import 'package:flutter/material.dart';
import 'package:health_assistant/screens/about_screen.dart';
import 'package:health_assistant/screens/login_screen.dart';
import 'package:health_assistant/screens/main_screen.dart';

import 'bloc/authentication_bloc.dart';


final Map<String, WidgetBuilder> getRouts = <String, WidgetBuilder>{
  MainPage.TAG: (ctx) => MainPage(),
  AboutPage.TAG: (ctx) => AboutPage(),
  LoginPage.TAG: (ctx,{loginBloc})=>LoginPage(loginBloc),
};

///  前往登录页(携带Bloc)
void popGoLoginPage(AuthenticationBloc loginBloc, BuildContext context) {
//  popGoPageBy(LoginPage.TAG, context, arg: loginBloc);
  Navigator.of(context).pop();
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginPage(loginBloc)));
}

void goPageBy(String pageTag, BuildContext context) {
  Navigator.of(context).pushNamed(pageTag);
}

void popGoPageBy(String pageTag, BuildContext context, {Object arg}) {
  Navigator.of(context).pop();
  Navigator.of(context).pushNamed(pageTag, arguments: arg);
}
