// Copyright 2019, Hu Wentao. All rights reserved.
// Email: hu.wentao@outlook.com
// Date : 2019/9/10
// Time : 0:05
import 'package:flutter/material.dart';
import 'package:health_assistant/screens/my_screen.dart';
import 'package:health_assistant/widget/widget.dart';

class BloodPressurePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("血压管理"),
        actions: <Widget>[
          Center(
              child: Text(
            "绑定硬件   ",
            style: TextStyle(fontSize: 14),
          ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(16.0), child: Text("来源: --")),
          Container(height: 24),
          getCircle(),
          getInfo(),
          getCardBlock(),
        ],
      ),
    );
  }

  getCircle() {
    return Center(
      child: ClipOval(
        child: Container(
          color: Colors.lightBlueAccent,
          width: 150,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                " --/--",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                "(mmHg)",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  getInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("心率: -- bpm"),
          Text("压差: -- mmHg"),
        ],
      ),
    );
  }

  getCardBlock() {
    ///
    final icons = [
      Icon(Icons.show_chart,size: 64,color: Colors.orange, ),
      Icon(Icons.security,  size: 64,color: Colors.orange,    ),
      Icon(Icons.assignment,size: 64,color: Colors.orange,      ),
      Icon(Icons.book,      size: 64,color: Colors.orange, ),
    ];
    final titles = ["血压趋势", "检测方案", "检测报告", "血压科普"];
    return Center(
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: List.generate(
            icons.length, (i) => buildValueBlock(icons[i], titles[i], padding: const EdgeInsets.all(32)),),
      ),
    );
  }
}
