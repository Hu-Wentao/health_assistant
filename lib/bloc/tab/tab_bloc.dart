import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:health_assistant/models/app_tab.dart';
import '../bloc.dart';

/// 主页切换tab
class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.CHECK;

  @override
  Stream<AppTab> mapEventToState(
    TabEvent event,
  ) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
