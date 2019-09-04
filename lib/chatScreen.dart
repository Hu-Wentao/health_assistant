import 'package:flutter/material.dart';


class chatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
    
      var card = new Card(
         child: Column(
           children: <Widget>[
             ListTile(
               title:new Text('爸爸',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('你在哪里'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('妈妈',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('回家吃饭吗'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('儿子',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('这儿呢'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('女儿',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('这儿呢'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('妻子',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('等会回家'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('小赵',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('听我说'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(), ListTile(
               title:new Text('小李',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('没错'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
           ],
         ),
      
      );


      return MaterialApp(
        title:'ListView widget',
        home:Scaffold(
          appBar:new AppBar(
            title:new Text('chatmain'),
          ),
          body:ListView(children:<Widget>[
            Center(child:card)],
        ),
      ),
      );
  }
}
