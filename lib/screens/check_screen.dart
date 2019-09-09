import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:health_assistant/routes.dart';
import 'package:health_assistant/widget/grid_data_block.dart';
import 'package:health_assistant/widget/widget.dart';

class CheckScreen extends StatelessWidget {
  //todo 这里可以直接 final bloc = BlocProvider.of ... 而这些bloc的声明都应在 main.dart中的 routs中的MultiBlocProvider中写好
  @override
  Widget build(BuildContext context) {
    return
//      SingleChildScrollView(
//      padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
//      child:
        Column(
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            _getRotation(), // 轮播图
            _getFloatButtonBar(), // 浮动按钮栏
          ],
        ),
        _getDailyQuestionBar(), // 每日一题
        _getHeathBar(), // "我的健康"
        _getHeathDataFlow(context), // 健康块

        _getRecommendBar(), // "推荐"
        _getRecommendList(context), // 推荐内容
      ],
//      ),
    );
  }

  ///==============================
  /// 轮播图
  Widget _getRotation() {
    List<Image> imgList = List.generate(
        3,
        (i) => Image.asset(
              'images/banner/banner_$i.png',
              fit: BoxFit.fill,
            ));
    return Container(
      padding: const EdgeInsets.only(bottom: 50), // 轮播图底部到"每日一题"的举例
      height: 227,
      child: Swiper(
        itemCount: 3,
        loop: true,
        scrollDirection: Axis.horizontal,
        index: 0,
//        autoplay: true,
        itemBuilder: (ctx, index) => imgList[index],
      ),
    );
  }

  /// 悬浮在banner之上的按钮栏
  Widget _getFloatButtonBar() {
    return RadiusContainer(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      padding: const EdgeInsets.fromLTRB(32, 10, 32, 10), // 容器内部padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            Icon(Icons.add_to_queue, color: Colors.blueAccent, size: 38),
            Container(width: 8),
            Text("快速问诊",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700))
          ]),
          Row(children: <Widget>[
            Icon(Icons.search, color: Colors.blueAccent, size: 38),
            Container(width: 8),
            Text("找医生",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700))
          ]),
        ],
      ),
    );
  }

  /// 每日一题 （动吖）
  Widget _getDailyQuestionBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Row(
        children: <Widget>[
          Text("每日一题",
              style: TextStyle(
                  fontFamily: "Raleway",
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.w800)),
          Icon(
            Icons.volume_up,
            color: Colors.deepOrangeAccent,
          ),
          Text("     不吃早饭易得胆结石？")
        ],
      ),
    );
  }

  /// "我的健康"
  Widget _getHeathBar() => _buildBar("我的健康", "更多 >");

  /// 健康数据 （动吖）
  Widget _getHeathDataFlow(BuildContext context) {
    /// 假数据
    final List<IconData> icons = [
      Icons.colorize,
      Icons.invert_colors,
      Icons.explore,
      Icons.add_box,
      Icons.phonelink_ring,
      Icons.book,
      Icons.assessment,
    ];

    // todo 添加一个 心跳
    final List<String> titls = [" 血压", " 血糖", " 体重", "", "", "", ""];
    final List<String> datas = [
      " --/-- mmHg",
      " -- mmol/L",
      " -- kg",
      "用药方案",
      "定时提醒",
      "学知识",
      "健康档案"
    ];
    final List<String> tips = [
      "要坚持测量哦～",
      "要坚持测量哦～",
      "要坚持测量哦～",
      "用药方案",
      "提醒不用愁",
      "健康新知识",
      "个人健康档案"
    ];

    final List<GridDataBundle> bundleList = List.generate(
        titls.length,
        (i) => GridDataBundle(
            icon: icons[i], title: titls[i], data: datas[i], tips: tips[i]));

    /// 占位
    final Widget placeHolder =
        Opacity(opacity: 0.0, child: GridDataBlock(bundleList[0]));
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.spaceEvenly,
      children: List<Widget>.generate(
              bundleList.length, (i) => GestureDetector(child: GridDataBlock(bundleList[i]), onTap: ()=>_onTapGridBlock(i, context),)) +
          [placeHolder, placeHolder],
    );
  }

  _getRecommendBar() {
    // todo "更多" 按钮添加点击事件到第二个页面...
    return _buildBar("推荐", "更多>");
  }

  _getRecommendList(BuildContext context) {
    return NewsTile(
      imgLead: Image.asset("images/recommend/img_1.jpg", fit: BoxFit.fitHeight),
      title: "糖尿病患者临睡前怎样合理加餐",
    );
  }
}

/// 点击了块
_onTapGridBlock(int i, BuildContext context) {
  switch(i){
    case 0:
      Navigator.of(context).pushNamed(AppRoutes.BLOOD_PRESSURE_PAGE);
      break;
    case 1:
      Navigator.of(context).pushNamed(AppRoutes.BLOOD_GLUCOSE_PAGE);
      break;
    case 2:
      Navigator.of(context).pushNamed(AppRoutes.WEIGHT_PAGE);
      break;
  }
}

Widget _buildBar(String title, String trail) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 18, 12, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Text(
          trail,
          style: TextStyle(color: Colors.black45, fontSize: 15),
        )
      ],
    ),
  );
}
