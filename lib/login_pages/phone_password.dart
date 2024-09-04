import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPasswordPageState();
  }
}

class LoginPasswordPageState extends State<LoginPasswordPage> {
  String phoneNumber = "";
  String password="";

  _login_phone_password() async {
    var response = await Dio().post("http://127.0.0.1:8000/users/login-phone-password/",
      data: {
        "area_number": "86",
        "phone_number": "12345678911",
        "password": "admin123"
      }
    );
    // {token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk5OTYxMzQ4LCJpYXQiOjE2OTczNjkzNDgsImp0aSI6ImNkZTJhYmFkZWY3ZjRkZGI5ZTUyNjhlN2M3MTRmZjFkIiwidXNlcl9pZCI6MTN9.KpyYksF2FoCApAvINTDvB4Qugu_DpRUhIDt9RWHuPy8}

    print(response.data);
    print(response.statusCode);
    print(response.data is Map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录页面")),
      body: Column(children: [
        Text("登录页面"),
        TextField(
          onChanged: (value){
            setState(() {
              phoneNumber = value;
            });
          },
          decoration: InputDecoration(
            labelText: "phone",
            hintText: "phone",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        TextField(
          onChanged: (value){
            setState(() {
              password = value;
            });
          },
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "您的登录密码",
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        ElevatedButton(onPressed: () {
          print("${phoneNumber}--${password}");
          _login_phone_password();

        }, child: Text("登录"))
      ]),
    );
  }
}
