import 'package:flutter/material.dart';
import '../login_pages/phone_password.dart';
import '../login_pages/init_user_study_space.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      ElevatedButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return LoginPasswordPage();
        }));
      }, child: Text("登录页面")),
      ElevatedButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return InitUserStudySpacePage();
        }));
      }, child: Text("初始化用户学习空间"))
    ],);
  }
}
