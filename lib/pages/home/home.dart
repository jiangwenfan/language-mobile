import 'package:flutter/material.dart';
import '../login/email_password.dart';
import '../login/init_user_study_space.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return EmailPasswordPage();
              }));
            },
            child: Text("登录页面")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return InitUserStudySpacePage();
              }));
            },
            child: Text("初始化用户学习空间"))
      ],
    );
  }
}
