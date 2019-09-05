// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/14
// Time : 11:52
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg) {
  if(msg == null) return;
  // 在安卓Q会出现 NPE
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 2,
      // todo 颜色考虑从Context中 获取
      backgroundColor: Colors.red,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14.0);
}