import 'package:flutter/material.dart';

class BookWidget extends StatefulWidget {
  const BookWidget({Key? key});

  @override
  State<StatefulWidget> createState() {
    return BookWidgetState();
  }
}

class BookWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Text('书籍页面');
  }
}
