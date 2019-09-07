import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  //todo 这里可以直接 final bloc = BlocProvider.of ... 而这些bloc的声明都应在 main.dart中的 routs中的MultiBlocProvider中写好
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("my"),
    );
  }
}
