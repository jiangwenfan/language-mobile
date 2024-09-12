import 'package:flutter/material.dart';
import 'package:open_language/api_utils/spaces.dart';
import 'package:open_language/utils/network.dart';

class SpaceHome extends StatefulWidget {
  const SpaceHome({Key? key}) : super(key: key);

  @override
  _SpaceHomeState createState() => _SpaceHomeState();
}

class _SpaceHomeState extends State<SpaceHome> {
  bool isLoading = true;
  String? error;
  List<Widget> spaceData = [];

  @override
  void initState() {
    super.initState();
    initSpaceData();
  }

  void initSpaceData() async {
    List spaces = await getUserAllSpaces();
    if (spaces.isNotEmpty) {
      setState(() {
        // print("获取用户space成功");
        isLoading = false;
        // 生成space卡片
        spaceData = generateSpaceWidgets(spaces);
      });
    } else {
      // print("获取用户space失败");
      setState(() {
        isLoading = false;
        error = "获取用户space失败";
      });
    }
  }

  List<Widget> generateSpaceWidgets(List spaces) {
    List<Widget> spaceWidgets = [];
    for (var space in spaces) {
      spaceWidgets
          .add(SpaceCardWidget(spaceId: space["id"], spaceName: space["name"]));
    }
    return spaceWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("space home"),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : error != null
              ? Text(error!)
              : Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: spaceData,
                ),
    );
  }
}

/// 单个space的样式
class SpaceCardWidget extends StatelessWidget {
  const SpaceCardWidget(
      {super.key, required this.spaceId, required this.spaceName});

  final int spaceId;
  final String spaceName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
          child: InkWell(
              onTap: () {
                print("跳转到space详情页面,携带spaceId=$spaceId");
                Navigator.pushNamed(context, "/home", arguments: {
                  "spaceId": spaceId,
                  // "spaceName": spaceName,
                });
                writeSpaceId(spaceId);
              },
              child: Text(spaceName))),
    );
  }
}
