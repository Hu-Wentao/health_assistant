import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_assistant/screens/about_screen.dart';
import 'package:health_assistant/routes.dart';

import 'bloc/authentication_bloc.dart';

void main() {
  // 全局强制竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RaceHF Bean',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home:Scaffold(
          appBar: AppBar(
            title: const Text("健康助手"),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () => goPageBy(AboutPage.TAG, context)),
            ],
          ),
//          drawer: _buildDrawer(context, _loginBloc),
        ),
        routes: getRouts,
      ),
    );
  }
}
