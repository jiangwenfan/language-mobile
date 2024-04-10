import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:audioplayers/audioplayers.dart';

class DouyinWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DouyinWordsState();
  }
}

class DouyinWordsState extends State {
  List<Widget> data = [];
  int num = 0;
  final player = AudioPlayer();

  //获取数据,默认从第0也开始获取
  _get_data({var index = 0}) async {
    var response = await Dio().get("http://localhost:3000/posts");
    if (response.statusCode == 200) {
      print("获取数据成功！");
      //获取数据list
      List resData = response.data;
      for (var i = 0; i < resData.length; i++) {
        data.add(Center(
          child:Column(children: [
            //图片
            Image.network("http://127.0.0.1/dog.jpeg",fit:BoxFit.cover),
            //播放
          ],),
        ));
      }
      print("数据长度: ${resData.length} ${data}");
    } else {
      //显示弹窗
      print("获取数据失败");
    }

    //播放第一个mp3
    await player.play(UrlSource('http://127.0.0.1/test.mp3'));
  }

  @override
  void initState() {
    super.initState();

    //初次加载页面时，生成一点数据
    _get_data();



    print("ok");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //离开页面时，关闭
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("认识单词"),
      ),
      body: PageView(
        children: data,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) async{
          //滑动时候，暂停上一个,根据索引播放data中的mp3
          player.stop();
          await player.play(UrlSource('http://127.0.0.1/test.mp3'));

          //无限滑动
          if (index + 2 == data.length) {
            setState(() {
              //开始获取新页的数据
              num += 1;
              _get_data(index: num);
            });
          }
        },
      ),
    );
  }
}
