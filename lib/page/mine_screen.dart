import 'package:flutter/material.dart';

class MineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的界面'),),
    body: new ListView(children: <Widget>[
    //昵称
    Container(
    height: 180.0,
    width: 250.0,
    decoration: new BoxDecoration(
    color: Color.fromRGBO(118, 179, 180, 0.5),
    borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
    ),
    child:Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Column(children:<Widget>[
    Icon(
    Icons.person,
    size:70.0,
    color: Colors.black12,
    ),
    Text("NickName",
    style: TextStyle(
    fontSize: 25.0,
    color: Colors.black,
    ),),
    Text("Tel:xxxxxxxx",
    style: TextStyle(
    fontSize: 18.0,
    color: Colors.black54,
    ),),
    RaisedButton(
    textTheme: ButtonTextTheme.accent,
    color: Colors.teal,
    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
    highlightColor: Colors.deepPurpleAccent,
    splashColor: Colors.deepOrangeAccent,
    colorBrightness: Brightness.dark,
    elevation: 40.0,
    highlightElevation: 80.0,
    disabledElevation: 20.0,
    onPressed: () {
    //TODO
    },
    child: Text(
    'Edit',
    style: TextStyle(color: Colors.white, fontSize: 15.0),
    ),
    )
    ],),
    /*
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child:Icon(Icons.arrow_right,size:50.0,color: Colors.black26,),
                  ),
                  */
    ],),),

    //列表
    Container(
    margin: EdgeInsets.only(top:3.0),
    height: 65.0,
    width: 250.0,
    decoration: new BoxDecoration(
    color: Color.fromRGBO(211, 224, 215, 0.5),
    border: new Border.all(//添加边框
    width: 0.6,//边框宽度
    color: Color.fromRGBO(153, 167, 131, 0.8),//边框颜色
    ),
    ),
    child:Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Padding(padding:EdgeInsets.only(left: 15.0),child:
    Icon(
    Icons.cloud,
    size:30.0,
    color: Colors.black38,
    ),),
    Padding(padding:EdgeInsets.only(left: 40.0),child:
    Text("xxxxxxxx",
    style: TextStyle(
    fontSize: 20.0,
    color: Colors.black87,
    ),
    ),),
    ],),),

    Container(
    height: 65.0,
    width: 250.0,
    decoration: new BoxDecoration(
    color: Color.fromRGBO(211, 224, 215, 0.5),
    border: new Border.all(//添加边框
    width: 0.6,//边框宽度
    color: Color.fromRGBO(153, 167, 131, 0.8),//边框颜色
    ),
    ),
    child:Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Padding(padding:EdgeInsets.only(left: 15.0),child:
    Icon(
    Icons.cloud,
    size:30.0,
    color: Colors.black38,
    ),),
    Padding(padding:EdgeInsets.only(left: 40.0),child:
    Text("xxxxxxxx",
    style: TextStyle(
    fontSize: 20.0,
    color: Colors.black87,
    ),
    ),),
    ],),),
    Container(
    height: 65.0,
    width: 250.0,
    decoration: new BoxDecoration(
    color: Color.fromRGBO(211, 224, 215, 0.5),
    border: new Border.all(//添加边框
    width: 0.6,//边框宽度
    color: Color.fromRGBO(153, 167, 131, 0.8),//边框颜色
    ),
    ),
    child:Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Padding(padding:EdgeInsets.only(left: 15.0),child:
    Icon(
    Icons.cloud,
    size:30.0,
    color: Colors.black38,
    ),),
    Padding(padding:EdgeInsets.only(left: 40.0),child:
    Text("xxxxxxxx",
    style: TextStyle(
    fontSize: 20.0,
    color: Colors.black87,
    ),
    ),),
    ],),),
    ],
    ),
    );
  }
}
