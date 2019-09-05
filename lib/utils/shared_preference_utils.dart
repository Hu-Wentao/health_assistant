// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/16
// Time : 11:42

import 'package:health_assistant/common/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

///数据库相关的工具
class SharedPreferenceUtil {
  static const String _USER_NAME = "username";
  static const String _USER_PWD = "password";
  static const String _USER_AVATAR = "avatar";
  static const String _LOGIN_STATE = "login_state";

  /// 保存账号, 传入null 即为注销
  static saveUser(User user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (user == null || user.isNullUser) {
      sp.setBool(_LOGIN_STATE, false);
      return;
    } else {
      sp.setBool(_LOGIN_STATE, true);
      sp.setString(_USER_NAME, user.uName);
      sp.setString(_USER_PWD, user.uPwd);
      // todo 加入保存用户头像
    }
  }

  /// 获取账号, 返回的User.isNullUser == true 即为无账号登录
  static Future<User> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return (sp.getBool(_LOGIN_STATE) ?? false)
        ? User(uName: sp.getString(_USER_NAME), uPwd: sp.getString(_USER_PWD))
        : User(isNullUser: true);
  }
}
