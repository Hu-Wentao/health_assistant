import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:health_assistant/widget/grid_data_block.dart';
import 'package:health_assistant/widget/widget.dart';

class CheckScreen extends StatelessWidget {
  //todo 这里可以直接 final bloc = BlocProvider.of ... 而这些bloc的声明都应在 main.dart中的 routs中的MultiBlocProvider中写好
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
      child: Column(
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
      ),
    );
  }

  ///==============================
  /// 轮播图
  Widget _getRotation() {
    List<Image> imgList = List.generate(
        3,
        (i) => Image.asset(
              'images/banner/banner_$i.jpg',
              fit: BoxFit.cover,
            ));
    return Container(
      padding: const EdgeInsets.only(bottom: 30), // 轮播图底部到"每日一题"的举例
      height: 260,
      child: Swiper(
        itemCount: 3,
        loop: true,
        scrollDirection: Axis.horizontal,
        index: 0,
        autoplay: true,
        itemBuilder: (ctx, index) => imgList[index],
      ),
    );
  }

  /// 悬浮在banner之上的按钮栏
  Widget _getFloatButtonBar() {
    return RadiusContainer(
      margin: const EdgeInsets.fromLTRB(24, 8, 24, 10),
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 12), // 容器内部padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            Icon(Icons.featured_play_list, color: Colors.blueAccent, size: 38),
            Container(width: 8),
            Text("快速问诊",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          ]),
          Row(children: <Widget>[
            Icon(Icons.search, color: Colors.blueAccent, size: 38),
            Container(width: 8),
            Text("找医生",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
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
    final List<String> titls = [" 血压", " 血糖", " 体重 ", "", "", "", ""];
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

//    print('CheckScreen._getHeathDataRow ${MediaQuery.of(context).size.width}');
//    final width = MediaQuery.of(context).size.width;
    // todo 考虑使用Flow来替换Wrap, 让子控件间隙对齐, 目前只能手动切换 spacing 8, 与spacing 17 以均衡间隙
    return Wrap(
      spacing: 15,
      runSpacing: 8,
//      runAlignment: WrapAlignment.,
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
//      crossAxisAlignment: WrapCrossAlignment.end,

      children:
          List.generate(bundleList.length, (i) => GridDataBlock(bundleList[i])),
    );
  }

  _getRecommendBar() {
    return _buildBar("推荐", "更多>");
  }

  _getRecommendList(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            width: 120,
            height: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  "images/recommend/img_1.jpg",
                  fit: BoxFit.fitHeight,
                ))),
        Expanded(
          child: Text(
            "糖尿病患者临睡前怎样合理加餐",
            style: Theme.of(context).textTheme.title,
          ),
        )
      ],
    );
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
