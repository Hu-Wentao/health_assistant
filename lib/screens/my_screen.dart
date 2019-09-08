import 'package:flutter/material.dart';
import 'package:health_assistant/routes.dart';

class MyScreen extends StatelessWidget {
  //todo 这里可以直接 final bloc = BlocProvider.of ... 而这些bloc的声明都应在 main.dart中的 routs中的MultiBlocProvider中写好

  /// 假数据
  final userCardTitles = ["关注", "订单", "钱包", "收藏"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _getUserCard(context),
      ],
    );
  }

  /// 用户信息卡
  _getUserCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
      // 背景图
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/user_card_bg.png"), fit: BoxFit.cover)),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // 第1行
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[Icon(Icons.notifications_none, size: 28)]),
            // 第2行, "登录/注册" 头像
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Text("登录/注册",
                        style:
                            TextStyle(fontWeight: FontWeight.w800, fontSize: 28)),
                    onTap: ()=>AppRouts.goPageBy(AppRouts.LOGIN_PAGE, context),
                  ),
                  ClipOval(child: Image.asset("images/default_avatar.png")),
                ],
              ),
            ),
            // 第3行, "关注" "医生" "钱包"...等
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  4, (i) => _buildValueBlock(0, userCardTitles[i])),
            ),
          ],
        ),
      ),
    );
  }
}

//. 上数值, 下文字
_buildValueBlock(int val, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Text("$val"),
        Text(title, style: TextStyle(fontWeight: FontWeight.w300)),
      ],
    ),
  );
}
