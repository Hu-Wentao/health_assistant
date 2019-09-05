import 'package:flutter/material.dart';

class FloatNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FloatNavigator();
}

class _FloatNavigator extends State<FloatNavigator>
    with SingleTickerProviderStateMixin {
  int _activeIndex = 0; // 激活的选项
  double _height = 48;
  double _floatRadius ; // 悬浮图标的半径
  double _moveTween = 0; // 移动补间动画
  double _padding = 10; // 浮动图标与圆弧之间的距离
  AnimationController _animationController ; // 动画控制器
  Animation<double> _moveAnimation; // 移动动画

  List<IconData> _navs = [  // 导航项图标
    Icons.search,
    Icons.ondemand_video,
    Icons.perm_contact_calendar,
  ];

  @override
  void initState() {
    _floatRadius = _height*2/3; // 悬浮图标的半径为 导航栏高度的 三分之二, 动画时长为400ms
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, title: Text("Float Bar"),centerTitle: true,),
            backgroundColor: Colors.amber,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  /// 浮动图标
                  /// 所有图标
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


