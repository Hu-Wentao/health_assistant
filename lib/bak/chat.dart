import 'package:flutter/material.dart';
import 'package:health_assistant/bak/BottomNavigationWidget.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}
