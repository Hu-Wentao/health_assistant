// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/13
// Time : 16:48

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_assistant/common/constances.dart';
import 'package:health_assistant/utils/toast_util.dart';
import 'package:health_assistant/widget/widget.dart';

class AboutPage extends StatelessWidget {
  static const TAG = "/AboutPage";

  @override
  Widget build(BuildContext context) {
//  final info = PackageInfo.fromPlatform(); // todo 以后加入动态获取版本
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return orientation == Orientation.portrait
              ? _getVerticalLayout(context)
              : _getHorizontalLayout(context);
        },
      ),
    );
  }

  Widget _getVerticalLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(children: _getFirstPartWidgets(context)+_getSecondPartWidgets(context)),
      ),
    );
  }

  Widget _getHorizontalLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: _getFirstPartWidgets(context),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: _getSecondPartWidgets(context),
            ),
          ),
        )
      ],),
    );
  }

  List<Widget> _getFirstPartWidgets(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 42, 32, 20),
        child: Image.asset('assets/images/app_icon.png', height: 100),
      ),
      RadiusContainer.col(children: <Widget>[
        ListTile(
          title:
              Text(aboutInfo[0], style: Theme.of(context).textTheme.subtitle),
          trailing: Text("v 1.0.2"), // todo 显示当前app版本....
        ),
        ListTile(
          title:
              Text(aboutInfo[1], style: Theme.of(context).textTheme.subtitle),
          trailing: Text("Latest version"),
          onTap: () {
            // todo 检查app更新 .....
            showToast("app is up to date");
          },
        ),
      ]),
    ];
  }
  List<Widget> _getSecondPartWidgets(BuildContext context) {
    return [
      RadiusContainer.col(children: [
        ListTile(
          title:
          Text(aboutInfo[2], style: Theme.of(context).textTheme.subtitle),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          title:
          Text(aboutInfo[3], style: Theme.of(context).textTheme.subtitle),
          subtitle: Text("hu.wentao@outlook.com"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            showToast("Email has been copied to the clipboard");
            Clipboard.setData(ClipboardData(text: "hu.wentao@racehf.com"));
          },
        ),
        ListTile(
          title:
          Text(aboutInfo[4], style: Theme.of(context).textTheme.subtitle),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {}, // todo 跳转到评分页面
        ),
      ])
    ];
  }
}
