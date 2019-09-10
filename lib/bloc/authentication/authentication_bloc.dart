import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:health_assistant/common/user.dart';
import 'package:health_assistant/config/config_net.dart';
import 'package:health_assistant/utils/shared_preference_utils.dart';
import 'package:health_assistant/utils/toast_util.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => UnKnow();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    // 拦截msg, 在页面中展示
    if (event.eventMsg != null) showToast(event.eventMsg);
    switch (event.runtimeType) {
      case VerifyUser:
        final user = (event as VerifyUser).user;
        // \ 开始验证
        Response response = await Dio().post(LOGIN_URL, queryParameters: {
          "userCode": user.uName,
          "userPwd": user.uPwd,
        });
        // 还差请求用户头像
        if (response.data['code'] == 200) {
          dispatch(Login(user, "Login completed"));
        } else {
          print('verifyUserInfo 登陆失败: ${response.data}');
          //todo 后端程序BUG.... 没有检查用户名是否重复
          dispatch(Logout("Sign in failed: Incorrect User Name or Password. Please re-enter."));
        }
        yield* _verifyUserInfo((event as VerifyUser).user);
        break;
      case Login:
//        print('LoginBloc.mapEventToState 收到保存用户的请求');
        final user = (event as Login).user;
        await SharedPreferenceUtil.saveUser(user);
        if (user.isNullUser) {
          yield UnSigned();
        } else {
          yield Signed(user);
        }
        yield* _saveUser((event as Login).user);
        break;
      case Logout:
        // todo 没有在远程注销, 因为没有存储cookie
        await SharedPreferenceUtil.saveUser(null);
        yield UnSigned();
        yield* _saveUser(null);
        break;
      case Register:
        final user = (event as Register).user;
        Response response = await Dio().post(REGISTER_URL, queryParameters: {
          "userCode": user.uName,
          "userPwd": user.uPwd,
        });
        // 还差请求用户头像
        if (response.data['code'] == 200) {
          // 注册成功, 2s后登录
          Future.delayed(const Duration(seconds: 2)).then((_) => dispatch(
              VerifyUser(user, "Registration successful! Signing in...")));
        } else {
          print('Register 注册失败: ${response.data}');
          dispatch(Logout("Sign in failed"));
        }
        break;
      case SyncLocalState:
        User user = await SharedPreferenceUtil.getUser();
        if (user.isNullUser) {
          yield UnSigned();
        } else {
          yield Signed(user);
        }
        yield* _syncState();
        break;
    }
  }

  /// 检查用户与密码是否正确
  /// 分发 [Login] 或 [Logout] 事件
  /// 不切换状态
  _verifyUserInfo(User user) async* {
    // \ 开始验证
    Response response = await Dio().post(LOGIN_URL, queryParameters: {
      "userCode": user.uName,
      "userPwd": user.uPwd,
    });

    // 还差请求用户头像
    if (response.data['code'] == 200) {
      print('verifyUserInfo 登陆成功!');
      dispatch(Login(user, "Login completed"));
    } else {
      print('verifyUserInfo 登陆失败: ${response.data}');
      dispatch(Logout("Sign in failed"));
    }
  }

  /// 用户名密码无问题, 已成功登陆, 保存状态到本地
  /// 如果 user.isNullUser 表示注销本地保存的登陆信息
  /// 分发 SignIn 或 SignOut 事件
  /// 切换到 [Signed] 或 [UnSigned] 状态
  _saveUser(User user) async* {
    await SharedPreferenceUtil.saveUser(user);
    if (user.isNullUser) {
      yield UnSigned();
    } else {
      yield Signed(user);
    }
  }

  /// 同步本地存储的状态到UserState
  /// 分发 SignIn 或 SignOut 事件
  /// 切换到 Signed 或 UnSigned状态
  _syncState() async* {
    print('UserBloc._syncState 收到同步本地数据的请求');
    User user = await SharedPreferenceUtil.getUser();

    print('UserBloc._syncState 发送状态');
    if (user.isNullUser) {
      yield UnSigned();
    } else {
      yield Signed(user);
    }
  }
}
