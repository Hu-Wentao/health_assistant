import 'package:flutter/material.dart';
import 'package:health_assistant/widget/grid_data_block.dart';
import 'package:health_assistant/widget/radius_container.dart';

class CheckScreen extends StatelessWidget {
  //todo 这里可以直接 final bloc = BlocProvider.of ... 而这些bloc的声明都应在 main.dart中的 routs中的MultiBlocProvider中写好
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 32,
          ),
//          _getRotation(),

          _getDailyQuestionBar(),
          Container(height: 8),
          _getMyHeathBar(),
          _getHeathDataRow(),
        ],
      ),
    );
  }
///==============================
  /// 轮播图
//  Widget _getRotation() {
//    return Swiper(
//
//    );
//  }

  /// 每日一题 （动吖）
  Widget _getDailyQuestionBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
  Widget _getMyHeathBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "我的健康",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            "更多 >",
            style: TextStyle(color: Colors.black45, fontSize: 15),
          )
        ],
      ),
    );
  }

  /// 健康数据 （动吖）
  Widget _getHeathDataRow() {
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
      "健康新知识"
      ,"个人健康档案"
    ];

    final List<GridDataBundle> bundleList = List.generate(
        titls.length,
        (i) => GridDataBundle(
            icon: icons[i], title: titls[i], data: datas[i], tips: tips[i]));
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children:
          List.generate(bundleList.length, (i) => GridDataBlock(bundleList[i])),
    );
  }

}
