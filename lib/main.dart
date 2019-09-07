import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_assistant/bloc/bloc.dart';
import 'package:health_assistant/page/home_page.dart';
import 'package:health_assistant/routes.dart';

import 'bloc/authentication/authentication_bloc.dart';

void main() =>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) => runApp(MyApp()));

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
//        debugShowCheckedModeBanner: false,
        title: 'health assistant',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        routes: {
          AppRouts.HOME_PAGE: (context) => MultiBlocProvider(
                providers: <BlocProvider>[
                  BlocProvider<TabBloc>(
                    builder: (context) => TabBloc(),
                  ),
                ],
                child: HomePage(),
              ),
//          AppRouts.ABOUT_PAGE:
//          AppRouts.LOGIN_PAGE:
        },
      ),
    );
  }
}
