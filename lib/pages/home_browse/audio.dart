import 'package:flutter/material.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({Key? key});

  @override
  State<StatefulWidget> createState() {
    return AudioWidgetState();
  }
}

class AudioWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Text('音频页面');
  }
}
