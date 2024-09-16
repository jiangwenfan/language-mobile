import 'package:flutter/material.dart';
import 'article.dart';
import 'book.dart';
import 'subtitle.dart';
import 'audio.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BrowsePageState();
  }
}

class BrowsePageState extends State with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool _isLoading = true;
  // 数据个数
  int _count = 0;
  // article 数据
  List<Map<String, dynamic>> data = [];

  // 获取article数据
  Future<String> fetchData() async {
    // 模拟接口延迟3秒钟
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      // 修改_isLoading状态
      _isLoading = false;
      _count = 30;
      // TODO 将数据更新到data中
      // TODO 接口中期望的字段:
      // id: 文章id
      // title: 文章标题
      // cover_url: 封面图片地址
      // author: 作者
      // desc: 描述
      // words: 字数
    });

    return '接口返回的数据';
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // 将接口数据处理为显示组件
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse'),
        bottom: TabBar(
          controller: _tabController,
          // isScrollable: true,
          tabAlignment: TabAlignment.fill,
          tabs: const <Widget>[
            Tab(
              text: '文章',
              icon: Icon(Icons.car_crash),
            ),
            Tab(
              text: '书籍',
              icon: Icon(Icons.bike_scooter),
            ),
            Tab(text: '字幕', icon: Icon(Icons.home_filled)),
            Tab(text: '音频', icon: Icon(Icons.audiotrack))
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        ArticleWidget(),
        BookWidget(),
        SubtitleWidget(),
        AudioWidget(),
      ]),
    );
  }
}
