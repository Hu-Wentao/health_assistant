import 'package:flutter/material.dart';

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
          autofocus: true,
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
  _getNews() {}

}

