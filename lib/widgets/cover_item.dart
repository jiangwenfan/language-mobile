import 'package:flutter/material.dart';

class CoverItemWidget extends StatelessWidget {
  // 基本UI: 上面显示封面图片，下面显示标题
  // 在基本ui上增加点击进入详情页的功能

  final String coverUrl;
  final String title;
  // 点击进入下一页的，页面路由. /detail /content
  final String nextPageRouteName;
  // 下一页面路由，所需要携带的参数
  final Map<String, dynamic> nextPageRouteArgs;

  const CoverItemWidget(
      {Key? key,
      required this.coverUrl,
      required this.title,
      required this.nextPageRouteName,
      required this.nextPageRouteArgs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 点击进入详情页/或者直接打开内容页
        print("$nextPageRouteName, $nextPageRouteArgs");
        // Navigator.of(context)
        //     .pushNamed(nextPageRouteName, arguments: nextPageRouteArgs);
      },
      child: Column(
        children: [
          // https://s21.ax1x.com/2024/06/18/pk0crgU.jpg
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(coverUrl, fit: BoxFit.cover),
          ),

          Text(title),
        ],
      ),
    );
  }
}
