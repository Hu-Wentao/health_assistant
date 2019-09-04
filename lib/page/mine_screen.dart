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

        width: 250.0,
        child:Column(
          children: <Widget>[
            ListTile(
              title:new Text('历史数据',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),),
              leading: new Icon(Icons.equalizer,color: Colors.blueGrey,size: 25.0,),
              trailing: new Icon(Icons.arrow_forward_ios,color: Colors.black26,),
            ),
            new Divider(),
            ListTile(
              title:new Text('意见反馈',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),),
              leading: new Icon(Icons.assignment,color: Colors.blueGrey,size: 25.0,),
              trailing: new Icon(Icons.arrow_forward_ios,color: Colors.black26,),
            ),
            new Divider(),
            ListTile(
              title:new Text('关于',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),),
              leading: new Icon(Icons.info,color: Colors.blueGrey,size: 22.0,),
              trailing: new Icon(Icons.arrow_forward_ios,color: Colors.black26,),
            ),
            new Divider(),
            ListTile(
              title:new Text('设置',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0),),
              leading: new Icon(Icons.settings,color: Colors.blueGrey,size: 22.0,),
              trailing: new Icon(Icons.arrow_forward_ios,color: Colors.black26,),
            ),

          ],
        ),),
    ],
    ),
    );
  }
}
