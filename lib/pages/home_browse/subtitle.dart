import 'package:flutter/material.dart';

class SubtitleWidget extends StatefulWidget {
  const SubtitleWidget({Key? key});

  @override
  State<StatefulWidget> createState() {
    return SubtitleWidgetState();
  }
}

class SubtitleWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Text('字幕页面');
  }
}
