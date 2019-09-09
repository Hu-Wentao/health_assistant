import 'package:flutter/material.dart';
//import 'pages/home_page.dart';
//import 'pages/news_screen.dart';
//import 'pages/mine_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> Screen_list = List();

  @override
  void initState(){
//    Screen_list
//      ..add(ComScreen())
//      ..add(HomeScreen())
//      ..add(MineScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen_list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_mail,
                color: _BottomNavigationColor,
              ),
              title: Text(
                  '社区',
                  style: TextStyle(color: _BottomNavigationColor)
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _BottomNavigationColor,
              ),
              title: Text(
                  '首页',
                  style: TextStyle(color: _BottomNavigationColor)
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mail_outline,
                color: _BottomNavigationColor,
              ),
              title: Text(
                  '我的',
                  style: TextStyle(color: _BottomNavigationColor)
              )
          ),
        ],
        currentIndex: _currentIndex ,
        onTap:(int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}