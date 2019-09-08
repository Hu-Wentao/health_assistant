// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/9/7
// Time : 21:10

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridDataBundle {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String data;
  final String tips;

  GridDataBundle(
      {@required this.icon,
      this.iconColor,
      @required this.title,
      @required this.data,
      @required this.tips});
}

class GridDataBlock extends StatelessWidget {
  GridDataBlock(this.bd, {this.width: 108, this.padding: const EdgeInsets.all(2)});

  final GridDataBundle bd;
  final double width;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ///  第一行
              Row(children: <Widget>[
                Icon(bd.icon, color: bd.iconColor ?? Theme.of(context).primaryColor),
                Text(bd.title)
              ]),
              Container(height: 20),

              ///  第二行 数值
              Row(children: <Widget>[Text(bd.data)]),
              Container(height: 14),

              ///  第三行 提示语
              Text(bd.tips,
                  style: TextStyle(color: Colors.black45, fontSize: 12))
            ],
          ),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.grey,
        elevation: 4,
      ),
    );
  }
}
