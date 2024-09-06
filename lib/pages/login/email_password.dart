import 'package:flutter/material.dart';
import '../../api_utils/login.dart';

class EmailPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmailPasswordPageState();
  }
}

class EmailPasswordPageState extends State<EmailPasswordPage> {
  String phoneNumber = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("login email password")),
      body: Column(children: [
        const Text("登录页面"),
        TextField(
          onChanged: (value) {
            setState(() {
              phoneNumber = value;
            });
          },
          decoration: const InputDecoration(
            labelText: "phone",
            hintText: "phone",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          decoration: const InputDecoration(
            labelText: "密码",
            hintText: "您的登录密码",
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print("${phoneNumber}--${password}");
              loginEmailPassword({});
            },
            child: Text("登录"))
      ]),
    );
  }
}
