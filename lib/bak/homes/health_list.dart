import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Health_List extends StatefulWidget {
  @override
  _Health_ListState createState() => _Health_ListState();
}

class _Health_ListState extends State<Health_List> {

  final Color accentColor = Color(0XFFFA2B0F);

  List<ItemModel> items = [
    ItemModel("身高", '183', '优秀'),
    ItemModel("BMI", '19', '正常'),
    ItemModel("心跳", '75', "正常"),
    ItemModel("血压", '115/75', '正常'),
  ];

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }




  //每个小部分的内容
  Widget _buildItemCardChild(ItemModel item){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(item.title.toString(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(item.numOne.toString(), style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.favorite, color: accentColor,)
          ],
        ),
            Text(item.numTwo.toString(), style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              ),
            ),
      ],
    );
  }

  //每一个卡片的样式
  Widget _buildItemCard(ItemModel item){
    return Container(
      width: 150,
      height: 105,
      padding: EdgeInsets.fromLTRB(30, 6, 16, 20),
      margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 1
            )
          ]
      ),
      //填入内容
      child: _buildItemCardChild( item),
    );
  }

  Widget _buildCardsList(){
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        var item = items.elementAt(index);
        return _buildItemCard( item);
      },
    );
  }


//历史记录
Widget _HistoryWidget() {
  var smallItemPadding = EdgeInsets.only(
      left: 12.0, right: 12.0, top: 12.0);
  return Container(
    margin: EdgeInsets.fromLTRB(20, 440, 10, 10),
    child: Column(
      children: <Widget>[
        Container(
          height: 100.0,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: smallItemPadding,
                  child: Column(
                    children: <Widget>[
//                      Image.asset(
//                        'images/ico_add_new.png',
//                        height: 40.0,
//                      ),
                     Icon(Icons.history, color: Colors.red,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('历史评分'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: smallItemPadding,
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Text('90'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('20日'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: smallItemPadding,
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Text('80'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('21日'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: smallItemPadding,
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Text('70'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('22日'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

  //正式构建
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[300],
          title: Text('您当前健康评分为：90',style: TextStyle(fontSize: 35,color: Colors.black,
              fontWeight: FontWeight.bold),)
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Stack(
          children: <Widget>[
            _buildCardsList(),
            _HistoryWidget(),
          ],
        ),
      ),
    );
  }
}

class ItemModel{
  final String title;
  final String numOne;
  final String numTwo;


  ItemModel(this.title, this.numOne, this.numTwo);
}


