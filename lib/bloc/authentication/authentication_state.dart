import 'package:health_assistant/common/user.dart';
import 'package:meta/meta.dart';

// 由于状态较简单, 暂时不使用enum

@immutable
abstract class AuthenticationState {
  final User user;

  AuthenticationState(this.user);
}

class Signed extends AuthenticationState {
  Signed(User user) : super(user);
}

class UnSigned extends AuthenticationState {
  UnSigned() : super(null);
}

/// 在应用数据尚未与 本地存储的数据同步时, 将会展示此状态
class UnKnow extends AuthenticationState {
  UnKnow() : super(null);
}
