import 'package:flutter/material.dart';
import '../../widgets/phonetic/douyinPage.dart';

class BookshelfPage extends StatefulWidget {
  const BookshelfPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BookshelfPageState();
  }
}
// TODO 获取所有需要用到的数据,传递过

class BookshelfPageState extends State<BookshelfPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("书架页面"),
      ],
    );
  }
}
