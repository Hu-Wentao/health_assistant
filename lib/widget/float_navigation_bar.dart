// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/9/5
// Time : 22:24

import 'package:flutter/material.dart';

///
/// 当前版本：
/// 1. 还需要参考BottomNavigationBar， 进行优化
/// 2. 活跃的Icon颜色， 目前直接使用 Theme.of(context).primaryColor, 不能手动设定
/// 3. backgroundColor, selectItemColor等都不能手动设定,
/// 4. FloatNavigationItem 类只有icon参数是有效的, 其他参数均没有被使用
/// 5. currentIndex 如果不为0， 则展示效果有BUG
/// 6. 图标的颜色切换前就变化了， 应当在图标动画播放完毕后， 再切换图标颜色
class FloatNavigationBar extends StatefulWidget {
  FloatNavigationBar({
    Key key,
    @required this.items,
    this.onTap,
    this.currentIndex = 0,
//    this.backgroundColor,
    this.iconSize = 26,
    this.selectedItemColor,
    this.unSelectedItemColor,
  })  : assert(items != null),
        assert(items.length >= 2),
        super(key: key);

  final List<FloatNavigationItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;

//  final double elevation;// z轴高度， 暂时不使用
//  final Color backgroundColor;  // 背景色， 暂时不使用
  final double iconSize;
  final Color selectedItemColor;
  final Color unSelectedItemColor;

  @override
  _FloatNavigationBarState createState() => _FloatNavigationBarState(
      items, onTap, iconSize, selectedItemColor, unSelectedItemColor);
}

class _FloatNavigationBarState extends State<FloatNavigationBar>
    with SingleTickerProviderStateMixin {
  int _activeIndex = 0; //激活项 //todo bug 如果不为0 则按钮位置异常
  final double _height = 42.0; //导航栏高度
  double _floatRadius; //悬浮图标半径
  double _moveTween = 0.0; //移动补间
  double _padding = 9.0; //浮动图标与圆弧之间的间隙
  AnimationController _animationController; //动画控制器
  Animation<double> _moveAnimation; //移动动画

  final List<FloatNavigationItem> items;
  final ValueChanged<int> onTap;
  final double iconSize;
  final Color selectedItemColor;
  final Color unSelectedItemColor;

  _FloatNavigationBarState(this.items, this.onTap, this.iconSize,
      this.selectedItemColor, this.unSelectedItemColor);

  @override
  void initState() {
    _floatRadius = _height * 2 / 3;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 220));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double singleWidth = width / items.length;
    return Container(
            color: Colors.transparent,
      width: width,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          //浮动图标
          Positioned(
            top: _animationController.value <= 0.5
                ? (_animationController.value * _height * _padding / 2) -
                    _floatRadius / 3 * 2
                : (1 - _animationController.value) * _height * _padding / 2 -
                    _floatRadius / 3 * 2,
            left: _moveTween * singleWidth +
                (singleWidth - _floatRadius) / 2 -
                _padding / 2,
            child: DecoratedBox(
              decoration: ShapeDecoration(shape: CircleBorder(), shadows: [
                BoxShadow(
                    blurRadius: _padding / 2,
                    offset: Offset(0, _padding / 2),
                    spreadRadius: 0,
                    color: Colors.black26),
              ]),
              child: CircleAvatar(
                  radius: _floatRadius - _padding, //浮动图标和圆弧之间设置8pixel间隙
                  backgroundColor: Colors.white,
                  child: Icon(items[_activeIndex].icon,
                      color: Theme.of(context).primaryColor)),
            ),
          ),
          //所有图标
          CustomPaint(
            child: SizedBox(
              height: _height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: items
                    .asMap()
                    .map((i, v) => MapEntry(
                        i,
                        GestureDetector(
                          child: Icon(v.icon,
                              size: 28,
                              color: _activeIndex == i
                                  ? Colors.transparent
                                  : Colors.grey),
                          onTap: () => _switchNav(i),
                        )))
                    .values
                    .toList(),
              ),
            ),
            painter: ArcPainter(
                navCount: items.length,
                moveTween: _moveTween,
                padding: _padding),
          )
        ],
      ),
    );
  }

  //切换导航
  _switchNav(int newIndex) {
    double oldPosition = _activeIndex.toDouble();
    double newPosition = newIndex.toDouble();
    if (oldPosition != newPosition &&
        _animationController.status != AnimationStatus.forward) {
      _animationController.reset();
      _moveAnimation = Tween(begin: oldPosition, end: newPosition).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInCubic))
        ..addListener(() {
          setState(() {
            _moveTween = _moveAnimation.value;
          });
        })
        ..addStatusListener((AnimationStatus status) {
          if (status == AnimationStatus.completed) {
            setState(() {
              _activeIndex = newIndex;
            });
          }
        });
      _animationController.forward();
    }

    // 调用点击事件
    onTap(newIndex);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

///绘制圆弧背景
class ArcPainter extends CustomPainter {
  final int navCount; //        导航总数
  final double moveTween; //    移动补间
  final double padding; //      间隙
  ArcPainter({this.navCount, this.moveTween, this.padding});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint() //      创建画笔
      ..color = (Colors.white) //  设置画笔颜色
      ..style = PaintingStyle.stroke; //获取画笔

    double width = size.width; //              导航栏总宽度，即canvas宽度
    double singleWidth = width / navCount; //  单个导航项宽度
    double height = size.height; //            导航栏高度，即canvas高度
    double arcRadius = height * 2 / 3; //      圆弧半径
    double restSpace = (singleWidth - arcRadius * 2) / 2; //单个导航项减去圆弧直径后单边剩余宽度

    Path path = Path() //   路径
      ..relativeLineTo(moveTween * singleWidth, 0)
      ..relativeCubicTo(restSpace + padding, 0, restSpace + padding / 2,
          arcRadius, singleWidth / 2, arcRadius) //   圆弧左半边
      ..relativeCubicTo(arcRadius, 0, arcRadius - padding, -arcRadius,
          restSpace + arcRadius, -arcRadius) //       圆弧右半边
      ..relativeLineTo(width - (moveTween + 1) * singleWidth, 0)
      ..relativeLineTo(0, height)
      ..relativeLineTo(-width, 0)
      ..relativeLineTo(0, -height)
      ..close();

    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class FloatNavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final Widget title;
  final Color backgroundColor;

  FloatNavigationItem(
      {@required this.icon,
      Widget activeIcon,
      this.title,
      this.backgroundColor})
      : activeIcon = activeIcon ?? icon,
        assert(icon != null);
}
