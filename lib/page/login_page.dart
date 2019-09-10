// Created by Hu Wentao.
// Email: hu.wentao@outlook.com
// Date : 2019/8/20
// Time : 9:15
import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:health_assistant/bloc/bloc.dart';
import 'package:health_assistant/common/user.dart';

class LoginPage extends StatefulWidget {
  static const TAG = "/LoginPage";

  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _account, _password, _rePassword;
  bool _isPwdObscure = true;
  bool _isRePwdObscure = true;
  Color _eyeColor;
  Color _reEyeColor;
  bool _isLogin = true;
  List _loginMethod = [
    {
      "title": "facebook",
      "icon": GroovinMaterialIcons.facebook,
    },
    {
      "title": "google",
      "icon": GroovinMaterialIcons.google,
    },
    {
      "title": "twitter",
      "icon": GroovinMaterialIcons.twitter,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc loginBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(height: kToolbarHeight),
//            _buildTitleAndLine(),
                _buildTitle(),
                _buildTitleLine(),
                SizedBox(height: 60.0),
                _buildAccountTextField(),
                SizedBox(height: 30.0),
                _buildPasswordTextField(context),
                _isLogin
                    ? _buildForgetPasswordText(context)
                    : _buildReInputPasswordTextField(context),

                SizedBox(height: 50.0),
                _buildLoginOrRegisterButton(context, loginBloc),
                SizedBox(height: 30.0),
//                _buildOtherLoginText(),
//                _buildOtherMethod(context),
                _buildToggleText(context),
              ],
            )));
  }

  Padding _buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        _isLogin ? '登录' : "注册",
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

  Padding _buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 40.0,
          height: 2.0,
        ),
      ),
    );
  }

  /// -----------------------
  Widget _buildTitleAndLine() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            _isLogin ? '登录' : "注册",
            style: TextStyle(fontSize: 42.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.0, top: 4.0),
          child: Align(
            alignment: _isLogin ? Alignment.bottomLeft : Alignment.bottomRight,
            child: Container(
              color: Colors.black,
              width: 40.0,
              height: 2.0,
            ),
          ),
        ),
      ],
    );
  }

  TextFormField _buildAccountTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '账号',
      ),
      validator: (String value) {
//        var emailReg = RegExp(
//            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
//        return !emailReg.hasMatch(value) ? '请输入正确的邮箱地址' : null;
        return value.isEmpty ? "请输入账号" : null;
      },
      onSaved: (String value) => _account = value,
    );
  }

  TextFormField _buildPasswordTextField(BuildContext context) => TextFormField(
        onSaved: (String value) => _password = value,
        obscureText: _isPwdObscure,
        validator: (String value) {
          return value.isEmpty ? '输入密码:' : null;
        },
        decoration: InputDecoration(
            labelText: '密码',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: _eyeColor,
                ),
                onPressed: () {
                  setState(() {
                    _isPwdObscure = !_isPwdObscure;
                    _eyeColor = _isPwdObscure
                        ? Colors.grey
                        : Theme.of(context).iconTheme.color;
                  });
                })),
      );

  /// 忘记密码
  Widget _buildForgetPasswordText(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: FlatButton(
            child: Text(
              '忘记密码?',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            onPressed: () {
              // todo 忘记密码部分
            },
          ),
        ),
      );

  /// 再次输入密码
  _buildReInputPasswordTextField(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
        child: TextFormField(
          onSaved: (String value) => _rePassword = value,
          obscureText: _isRePwdObscure,
          validator: (String value) {
            if (value.isEmpty) {
              return '再次输入密码:';
            } else if (_password != _rePassword) {
              return "密码不匹配";
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
              labelText: '再次输入',
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: _reEyeColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isRePwdObscure = !_isRePwdObscure;
                      _reEyeColor = _isRePwdObscure
                          ? Colors.grey
                          : Theme.of(context).iconTheme.color;
                    });
                  })),
        ),
      );

  /// 登录/ 注册 按钮
  Align _buildLoginOrRegisterButton(
    BuildContext context,
    AuthenticationBloc _loginBloc,
  ) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            _isLogin ? '登录' : "注册",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
          color: Colors.black,
          onPressed: () {
            // 保存当前输入的数据
            _formKey.currentState.save();
            if (_formKey.currentState.validate()) {
              final user = User(uName: _account, uPwd: _password);
              _loginBloc.dispatch(_isLogin
                  ? VerifyUser(user, "正在验证密码...")
                  : Register(user, "正在注册..."));
            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  Align _buildOtherLoginText() {
    return Align(
        alignment: Alignment.center,
        child: Text(
          '其他账号登录',
          style: TextStyle(color: Colors.grey, fontSize: 14.0),
        ));
  }

  /// 第三方登录
  ButtonBar _buildOtherMethod(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: _loginMethod
          .map((item) => Builder(
                builder: (context) {
                  return IconButton(
                      icon: Icon(item['icon'],
                          color: Theme.of(context).iconTheme.color),
                      onPressed: () {
                        //TO DO : 第三方登录方法
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text("${item['title']}登录"),
                          action: new SnackBarAction(
                            label: "取消",
                            onPressed: () {}, //todo
                          ),
                        ));
                      });
                },
              ))
          .toList(),
    );
  }

  Align _buildToggleText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text((_isLogin ? "没有" : "已有") + "账号? "),
            FlatButton(
              child: Text(
                _isLogin ? '点击注册' : "点击登录",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                setState(() {
                  // 复位状态
                  _isPwdObscure = true;
                  _isRePwdObscure = true;
                  //切换登录,注册
                  _isLogin = !_isLogin;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    AutoOrientation.portraitAutoMode();
//
    BlocProvider.of<AuthenticationBloc>(context).state.listen((state) {
      if (state.runtimeType == Signed) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    AutoOrientation.fullAutoMode();
  }
}
