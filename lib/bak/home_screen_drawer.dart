//// Created by Hu Wentao.
//// Email: hu.wentao@outlook.com
//// Date : 2019/8/21
//// Time : 9:52
////part of 'home_page.dart';
//
//_buildDrawer(BuildContext context, AuthenticationBloc loginBloc) =>
//    Drawer(
//      //侧边栏按钮Drawer
//      child: ListView(
//        children: <Widget>[
//          BlocBuilder<AuthenticationBloc, AuthenticationState>(
//              bloc: loginBloc,
//              builder: (BuildContext context, AuthenticationState state) {
//                switch (state.runtimeType) {
//                  case Signed:
//                    return _buildDrawerHead(context, state.user, loginBloc);
//                  case UnSigned:
//                    return _buildDrawerUserUnsigned(loginBloc, context);
//                  case UnKnow:
//                    return _buildDrawerUserUnKnow(context, loginBloc);
//                  default:
//                    throw "异常! 缺少case!";
//                }
//              }),
//          const Divider(),
//
//          ListTile(
//              leading: Icon(Icons.info_outline),
//              title: Text('About'),
////              trailing:  Icon(Icons.arrow_upward),
//              onTap: () => popGoPageBy(AboutPage.TAG, context)), //分割线控件
//        ],
//      ),
//    );
//
//
//_buildDrawerUserUnsigned(AuthenticationBloc loginBloc, BuildContext context) {
//  return Column(
//    children: <Widget>[
//      Padding(
//          padding: const EdgeInsets.only(top: 32),
//          child: Text(
//            "To synchronise,\n log in first",
//            style: Theme.of(context).textTheme.title,
//            textAlign: TextAlign.center,
//          )),
//      Padding(
//        padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
//        //
//        child: FlatButton(
//            onPressed: () => popGoLoginPage(loginBloc, context),
//            child: const Text("Login"),
//          shape: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(20)),),
//        ),
//      ),
//    ],
//  );
//}
//
//_buildDrawerUserUnKnow(BuildContext context, AuthenticationBloc userBloc) {
//  print('MainPage._buildDrawerUserUnKnow 先发送同步请求');
//  userBloc.dispatch(SyncLocalState());
//  return Column(
//    children: <Widget>[
//      const Text("Syncing local data ..."),
//    ],
//  );
//}
//
//_buildDrawerHead(BuildContext context, User user, AuthenticationBloc loginBloc) {
//  return UserAccountsDrawerHeader(
//    currentAccountPicture: ClipOval(
////      radius: 10,
//      //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
//      child: Image.asset("assets/images/user.png"),
//      clipBehavior: Clip.antiAliasWithSaveLayer,
//    ),
//    accountName: null,
//    accountEmail: ListTile(
//        title: Text(
//          "${user.uName}",
//          style: TextStyle(color: Colors.black),
//        ),
////        trailing: Text('Sign out',style: TextStyle(color: Colors.red),),
//        trailing: Icon(
//          Icons.power_settings_new,
//          color: Colors.red,
//        ),
//        onTap: () {
//          loginBloc.dispatch(
//            Logout("Signing out..."),
//          );
//        }),
//    decoration: BoxDecoration(color: Colors.black12),
////    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/banner.png")),)
//  );
//}
