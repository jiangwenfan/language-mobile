import '../home_browse/home.dart';
import '../home_bookshelf/bookshelf.dart';
import 'package:open_language/pages/home_mine/mine.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.arguments});

  final Map arguments;
  final String title = "hello";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> data = [
    BrowsePage(),
    BookshelfPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: data[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore), label: "浏览"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "书架"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
    );
  }
}
