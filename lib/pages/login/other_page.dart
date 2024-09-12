import 'package:flutter/material.dart';

class LoginOtherPage extends StatefulWidget {
  const LoginOtherPage({Key? key}) : super(key: key);

  @override
  _LoginOtherPageState createState() => _LoginOtherPageState();
}

class _LoginOtherPageState extends State<LoginOtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login other"),
      ),
      body: Column(
        children: [
          const Text("其他登录方式"),
          ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, "/loginEmailPassword");
                print("跳转到邮箱密码登录页面");
              },
              child: const Text("邮箱密码登录"))
        ],
      ),
    );
  }
}
