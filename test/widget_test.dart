// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';




void main() async {
  test("获取今日头条新闻", await ttt());
}

ttt() async {

//  var url = "https://www.toutiao.com/ch/news_health/";
var url = "https://3g.163.com//touch/reconstruct/article/list/BDC4QSV3wangning/0-10.html";
  Response response = await new Dio().get(url);

  print(  response.data.toString());
}
