import 'package:flutter/material.dart';
import 'douyinPage.dart';

class ToolsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ToolsPageState();
  }
}
// TODO 获取所有需要用到的数据,传递过

class ToolsPageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text("phonetic"),

        //入门1.0，滑动认识词
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return DouyinWords();
              }));
            },
            child: Text("滑动认识词"))
      ],
    );
  }
}
