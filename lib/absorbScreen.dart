import 'package:flutter/material.dart';


class absorbScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
    
      var card = new Card(
         child: Column(
           children: <Widget>[
             ListTile(
               title:new Text('爸爸',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('1513938888'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('妈妈',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('1513938888'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('儿子',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('1513938888'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('女儿',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('1513938888'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('妻子',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('1513938888'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(),
              ListTile(
               title:new Text('小赵',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('1513938888'),
              leading:  new CircleAvatar(
                 backgroundImage: new NetworkImage('1.jpg'),
                  radius: 20.0,),
             ),
             new Divider(), ListTile(
               title:new Text('小李',style: TextStyle(fontWeight: FontWeight.w500),),
               subtitle: new Text('1513938888'),
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
            title:new Text('关注'),
          ),
          body:ListView(children:<Widget>[
            Center(child:card)],
        ),
      ),
      );
  }
}
