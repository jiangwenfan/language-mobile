import 'package:flutter/material.dart';
import 'package:open_language/utils/network.dart';

class AppIndexPage extends StatefulWidget {
  const AppIndexPage({Key? key}) : super(key: key);

  @override
  _AppIndexPageState createState() => _AppIndexPageState();
}

class _AppIndexPageState extends State<AppIndexPage> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  // 检查token是否存在
  void _checkToken() async {
    String token = await readToken(); // 获取token

    if (token == "") {
      // token不存在, 跳转到登录页面
      Navigator.pushReplacementNamed(context, "/loginHome");
    } else {
      // token存在,
      int spaceId = await readSpaceId(); // 获取spaceId
      if (spaceId == 0) {
        // spaceId不存在, 跳转到space页面
        Navigator.pushReplacementNamed(context, "/space");
      } else {
        // 跳转到home页面
        Navigator.pushReplacementNamed(context, "/home", arguments: {
          "spaceId": spaceId,
          // "spaceName": spaceName,
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app index"),
      ),
      body: const CircularProgressIndicator(),
    );
  }
}
