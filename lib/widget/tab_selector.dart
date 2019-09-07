import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_assistant/models/app_tab.dart';
import 'package:health_assistant/widget/float_navigation_bar.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatNavigationBar(
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: <FloatNavigationItem>[
        FloatNavigationItem(icon: Icons.assignment),
        FloatNavigationItem(icon: Icons.all_inclusive),
        FloatNavigationItem(icon: Icons.person),
      ],
    );

// v   return BottomNavigationBar(
// v     currentIndex: AppTab.values.indexOf(activeTab),
// v     onTap: (index) => onTabSelected(AppTab.values[index]),
// v     items: AppTab.values.map((tab) {
// v       return BottomNavigationBarItem(
//          icon: Icon(
//            tab == AppTab.todos ? Icons.list : Icons.show_chart,
//            key: tab == AppTab.todos
//                ? ArchSampleKeys.todoTab
//                : ArchSampleKeys.statsTab,
//          ),
//          title: Text(tab == AppTab.stats
//              ? ArchSampleLocalizations.of(context).stats
//              : ArchSampleLocalizations.of(context).todos),
//        );
//      }).toList(),
//    );
  }
}
