import 'package:flutter/material.dart';

//import 'package:demo01/chat.dart';
// 引入头文件
void main() {
  runApp(new MaterialApp(
    title: '综合 布局',
    home: new ComScreen(),
    
  ));
}

class ComScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //健康大讲堂部分
    Widget addressContainer = Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new NetworkImage('1.jpg'),
                      radius: 20.0,
                    ),
                    Expanded(
                        child: Text('WXY', style: TextStyle(fontSize: 15.0)))
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('这个app很好用,希望越累越多的人知道他 ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(color: Colors.grey[500], fontSize: 20.0)),
                ),
                Row(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new NetworkImage(''),
                      radius: 20.0,
                    ),
                    Expanded(
                        child: Text('WXY', style: TextStyle(fontSize: 15.0)))
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('这个app很好用',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(color: Colors.grey[500], fontSize: 20.0)),
                ),
                Row(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new NetworkImage('1.jpg'),
                      radius: 20.0,
                    ),
                    Expanded(
                        child: Text('WXY', style: TextStyle(fontSize: 15.0)))
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('这个app很好用,希望越累越多的人知道他 ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(color: Colors.grey[500], fontSize: 20.0)),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // 构建按钮组中单个按钮
  

    // 按钮组件部分
    Widget buttonsContainer = Container(
      margin: EdgeInsets.only(top: 10.0),
      //横向布局
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.star),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/absorb') //
              ),
          IconButton(
              icon: Icon(Icons.tab),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/absorb') // 
              ),
               IconButton(
              icon: Icon(Icons.chat),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/absorb') // 
              ),
         
        ],
      ),
    );

    //  文本
    Widget textContainer = Container(
        padding: const EdgeInsets.all(32.0),
        decoration: new BoxDecoration(
          color: Color.fromRGBO(182, 172, 119, 0.3),
          // borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        // 文本引用 '''
        child: Text(
          '''
          - -健康小提示- -
           1.
           2.
           3.
          ''',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
          softWrap: true,
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text('社区界面'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: 640.0,
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'http://tupian.qqjay.com/u/2017/1020/1_145153_1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: textContainer,
          ),
/*
          Image.network('http://tupian.qqjay.com/u/2017/1020/1_145153_1.jpg', //引用
              width: 640.0, height: 200.0, fit: BoxFit.cover),

          */
          buttonsContainer,
          addressContainer,
        ],
      ),
    );
  }
}
