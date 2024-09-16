import 'package:flutter/material.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key? key});

  @override
  State<StatefulWidget> createState() {
    return ContentWidgetState();
  }
}

class ContentWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Text('内容页面');
  }
}
