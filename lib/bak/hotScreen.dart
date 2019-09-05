import "package:flutter/material.dart";



class hotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hot',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("<", style: TextStyle(color: Colors.white))),
      body: Container(
          margin: EdgeInsets.only(top:3.0),
    height: 150.0,
    width: 420.0,
    decoration: new BoxDecoration(
    color: Color.fromRGBO(211, 224, 215, 0.5),
    border: new Border.all(//添加边框
    width: 0.6,//边框宽度
    color: Color.fromRGBO(153, 167, 131, 0.8),),),//边框颜色
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Row(
            children: <Widget>[
  
                
              Expanded(child: Text('', style: TextStyle(fontSize: 15.0))),
              Text('2019-8-10',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20.0,
                  ) 
                  )
            ],
   
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Column(
                  children: <Widget>[
                    Text("Flutter第4天--基础控件(下)+Flex布局详解"),
                    Container(
                      width: 300,
                      child: Text('Flutter第4天--基础控件(下)+Flex布局详解',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 20.0,
                          )),
                    ),
                  ],
                ),
              Row( 
                children: <Widget>[
                    Image.network('http://tupian.qqjay.com/u/2017/1020/1_145153_1.jpg' , width: 80, height: 80, fit: BoxFit.fitHeight)
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.grade,
                color: Colors.green,
                size: 20,
              ),
              Text(
                "1000W",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 20.0,
                ),
              ),
              Icon(Icons.tag_faces, color: Colors.lightBlueAccent, size: 20),
              Text(
                "2000W",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
         
        ],
      ),
      
      ),
     );
      
     
  }
}


