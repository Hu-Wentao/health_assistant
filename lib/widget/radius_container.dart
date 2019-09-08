// Copyright 2019, Hu Wentao. All rights reserved.
// Use of this source code is governed by the MIT license
// Email: hu.wentao@outlook.com
// Date : 2019/8/6
// Time : 19:28
import 'package:flutter/material.dart';

class RadiusContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color bgColor;

  RadiusContainer({
    Key key,
    this.child,
    this.margin: const EdgeInsets.all(8),
    this.padding: const EdgeInsets.all(8),
    this.bgColor,
  }) : super(key: key);

  RadiusContainer.col({Key key, List<Widget> children})
      : this(key: key, child: Column(children: children));

  RadiusContainer.row({Key key, List<Widget> children})
      : this(key: key, child: Row(children: children));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Material(
        child: Container(
          padding: padding,
            child: child,
        ),
        color: bgColor,
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.grey,
        elevation: 4,
      ),
    );
  }
}
