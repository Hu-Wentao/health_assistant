import 'package:flutter/material.dart';
import 'package:health_assistant/widget/widget.dart';

class NewsScreen extends StatelessWidget {
  //todo 这里可以直接 final bloc = BlocProvider.of ... 而这些bloc的声明都应在 main.dart中的 routs中的MultiBlocProvider中写好
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //
        _getSearchBar(),
        //
        _getNews(),
      ],
    );
  }

  _getSearchBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        child: TextField(
          autofocus: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none)),
          onChanged: (value) {
//                this._keywords=value;
          },
        ),
        height: 32,
        decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.8),
            borderRadius: BorderRadius.circular(30)),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Icon(Icons.search),
        )
      ],
    );
  }

  _getNews() {
    /// 假数据
    List<String> titles = [
      "宝宝咳嗽老不好干万别乱止咳要先分清咳嗽类型才能对症下药",
      "家长秋天多绐孩子吃这些食物帮助孩子长高又长个",
      '越传越"神"的治癌谣言你听过吗？',
      '科普讲座：肺部小结节——"纠结不纠结"',
    ];
    List<String> authors = [
      "儿科主任王铮",
      "儿科主任李萍",
      "独具慧言",
      "美中加和",
      "福建卫生报",
    ];

    return Column(
      children: List<Widget>.generate(
          titles.length,
          (i) => NewsTile(
                title: titles[i],
            imgTrail: Image.asset("images/news/news$i.png", fit: BoxFit.fitWidth,),
            author: authors[i],
              )),
    );
  }
}