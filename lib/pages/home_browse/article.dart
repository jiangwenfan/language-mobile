import 'package:flutter/material.dart';
import 'package:open_language/widgets/cover_item.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return ArticleWidgetState();
  }
}

class ArticleWidgetState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _count == 0
            ? const Center(child: Text('暂无数据'))
            : GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // 水平轴显示元素个数
                  crossAxisCount: 3,
                  // 水平轴元素间距
                  crossAxisSpacing: 22,
                  // 垂直轴元素间距
                  mainAxisSpacing: 30,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue,
                    child: CoverItemWidget(
                      coverUrl: "https://s21.ax1x.com/2024/06/18/pk0crgU.jpg",
                      // coverUrl: data[index]["cover_url"],
                      title: "title $index",
                      // title: data[index]["title"],
                      nextPageRouteName: "/detail",
                      nextPageRouteArgs: {
                        "id": index,
                        // "id": data[index]["id"],
                        "author": "aa",
                        // "author": data[index]["author"],
                        "desc": "bb",
                        // "desc": data[index]["desc"],
                        "words": 100
                        // "words": data[index]["words"],
                      },
                    ),
                  );
                },
                itemCount: _count,
              );
  }
}
