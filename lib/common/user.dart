// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/16
// Time : 11:43

class User {
//  final Image avatar;
  final String uName;
  final String uPwd;

  final bool isNullUser;

  User({
    //      @required this.avatar // todo 添加存储用户头像功能
    this.uName,
    this.uPwd,
    this.isNullUser: false,
  })  : assert(isNullUser || uName != null),
        assert(isNullUser || uPwd != null);
}
