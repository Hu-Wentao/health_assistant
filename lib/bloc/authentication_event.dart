import 'package:health_assistant/common/user.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent {
  final String eventMsg;

  AuthenticationEvent(this.eventMsg);
}

/// 检查用户与密码是否正确
class VerifyUser extends AuthenticationEvent {
  final User user;

  VerifyUser(this.user, String eventMsg) : super(eventMsg);
}

/// 用户名密码无问题, 已成功登陆, 保存状态到本地
class Login extends AuthenticationEvent {
  final User user;
  Login(this.user, String eventMsg) : super(eventMsg);
}

class Logout extends AuthenticationEvent {
  Logout(String eventMsg) : super(eventMsg);
}
/// 注册
class Register extends AuthenticationEvent {
  final User user;
  Register(this.user, String eventMsg) : super(eventMsg);
}

/// 与本地 SharedPreference 存储的状态进行同步
class SyncLocalState extends AuthenticationEvent {
  SyncLocalState({String eventMsg}) : super(eventMsg);
}
