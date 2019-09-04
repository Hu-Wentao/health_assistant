import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME界面'),),
      body: Center(
        child: Text('Home_body',style: TextStyle(fontSize: 30.0),),
      ),
    );
  }
}
