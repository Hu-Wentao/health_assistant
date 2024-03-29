import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_assistant/bloc/bloc.dart';
import 'package:health_assistant/routes.dart';
import 'package:health_assistant/utils/toast_util.dart';

class MyScreen extends StatelessWidget {
  //todo 这里可以直接 final bloc = BlocProvider.of ... 而这些bloc的声明都应在 main.dart中的 routs中的MultiBlocProvider中写好

  /// 假数据
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return
//      SingleChildScrollView(
//      child:
        Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _getUserCard(context, authBloc),
        _getTitleBar("常用工具"),
        _getToolFlow(context),
        _getTitleBar("关于"),
        _getMoreTiles(context),
      ],
//      ),
    );
  }

  /// 用户信息卡
  _getUserCard(BuildContext context, AuthenticationBloc authBloc) {
    const List<String> userCardTitles = ["关注", "订单", "钱包", "收藏"];

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
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      bloc: authBloc, builder: _buildUserNameTitle),
                  ClipOval(child: Image.asset("images/default_avatar.png")),
                ],
              ),
            ),
            // 第3行, "关注" "医生" "钱包"...等
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4,
                  (i) => buildValueBlock(const Text("0"), userCardTitles[i])),
            ),
          ],
        ),
      ),
    );
  }

  _getTitleBar(String title) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        Container(
          height: 0,
        )
      ],
    );
  }

  /// 常用工具
  _getToolFlow(BuildContext context) {
    /// 图标数据
    final List<Image> imgList = [
      Image.asset("images/my_screen/ic_tjyy.png", width: 28),
      Image.asset("images/my_screen/ic_wdjd.png", width: 28),
      Image.asset("images/my_screen/ic_wdwd.png", width: 28),
      Image.asset("images/my_screen/ic_wdbx.png", width: 28),
      Image.asset("images/my_screen/ic_jyfw.png", width: 28),
      Image.asset("images/my_screen/ic_lxkf.png", width: 28),
      Image.asset("images/my_screen/ic_xtsz.png", width: 28),
    ];
    List<String> titles = [
      "预约体检",
      "我的解读",
      "我的问答",
      "我的保险",
      "就医服务",
      "联系客服",
      "系统设置",
    ];
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: (List<Widget>.generate(
              imgList.length,
              (i) => buildValueBlock(imgList[i], titles[i],
                  padding: const EdgeInsets.all(16))) +
          // 占位
          [
            Opacity(
              opacity: 0.0,
              child: buildValueBlock(imgList[0], titles[0]),
            )
          ]),
    );
  }

  _getMoreTiles(BuildContext context) {
    final List<String> titles = ["当前版本: ", "检查更新: ", "帮助与反馈:", "为App评分"];
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(titles[0], style: Theme.of(context).textTheme.subtitle),
            trailing: Text("v 1.0.2"), // todo 显示当前app版本....
          ),
          ListTile(
            title: Text(titles[1], style: Theme.of(context).textTheme.subtitle),
            trailing: Text("点击检查更新"),
            onTap: () {
              // todo 检查app更新 .....

              showToast("Checking...");
              Future.delayed(const Duration(milliseconds: 1200)).then((_) {
                showToast("当前已是最新版本");
              });
            },
          ),
          ListTile(
            title: Text(titles[2], style: Theme.of(context).textTheme.subtitle),
//            subtitle: Text("hu.wentao@outlook.com"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              showToast("反馈邮箱已复制到剪贴板");
              Clipboard.setData(ClipboardData(text: "hu.wentao@racehf.com"));
            },
          ),
          ListTile(
            title: Text(titles[3], style: Theme.of(context).textTheme.subtitle),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {}, // todo 跳转到评分页面
          ),
        ],
      ),
    );
  }
}

Widget _buildUserNameTitle(BuildContext ctx, AuthenticationState state) {
  if (state is Signed) {
    return Text(state.user.uName,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28));
  } else {
    return GestureDetector(
      child: Text("登录/注册",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28)),
      onTap: () => AppRoutes.goPageBy(AppRoutes.LOGIN_PAGE, ctx),
    );
  }
}

/// 上widget, 下文字    //todo 添加点击事件入口
buildValueBlock(Widget wid, String title,
    {EdgeInsets padding: const EdgeInsets.all(8.0)}) {
  return Padding(
    padding: padding,
    child: Column(
      children: <Widget>[
        wid,
        Text(title, style: TextStyle(fontWeight: FontWeight.w400))
      ],
    ),
  );
}
