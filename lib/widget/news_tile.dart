// Copyright 2019, Hu Wentao. All rights reserved.
// Email: hu.wentao@outlook.com
// Date : 2019/9/9
// Time : 20:39
import 'package:flutter/material.dart';

///
/// 仿新闻类app的新闻列表条目
///
class NewsTile extends StatelessWidget {
  final Image imgLead;
  final String title;
  final Image imgTrail;

  final String author;
  final String time;

  const NewsTile({
    Key key,
    this.imgLead,
    this.title,
    this.imgTrail,
    this.author,
    this.time,
  })  : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widList = [];
    if (imgLead != null) widList.add(processImg(imgLead));
    widList.add(Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.title),
          Row(children: <Widget>[Text(author), Text(time)])
        ],
      ),
    ));
    if (imgTrail != null) widList.add(processImg(imgTrail));

    return Row(children: widList);
  }

  static processImg(Image img) {
    if (img == null) return null;
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        width: 120,
        height: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)), child: img));
  }
}
