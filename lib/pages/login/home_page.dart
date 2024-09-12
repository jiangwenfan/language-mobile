import 'package:flutter/material.dart';
import 'package:open_language/utils/my_icon.dart';
import 'package:open_language/api_utils/utils.dart';
import 'package:open_language/api_utils/login.dart';
import 'package:open_language/utils/network.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login home"),
      ),
      body: Column(
        children: [
          // phone+sms code登录
          PhoneSmsCodeWidget(),
          // 其他登录方式跳转
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/loginOther");
              },
              child: const Text("其他登录方式")),
          // oauth2登录方式
          const OAuthWidget()
        ],
      ),
    );
  }
}

/// phone + sms code登录widget
class PhoneSmsCodeWidget extends StatefulWidget {
  const PhoneSmsCodeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PhoneSmsCodeWidgetState();
  }
}

class PhoneSmsCodeWidgetState extends State<PhoneSmsCodeWidget> {
  String? phoneNumber;
  String? smsCode;
  bool isSmsCodeSent = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.phone,
          size: 100,
        ),
        Row(
          children: [
            // 选择国家
            // DropdownButton<String>(
            //   value: "中国",
            //   onChanged: (String? newValue) {
            //     print("选择了国家: $newValue");
            //   },
            //   items: <String>["中国", "美国", "英国", "法国"]
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            // 输入手机号
            SizedBox(
              height: 100,
              width: 350,
              child: TextField(
                onChanged: (value) {
                  // print("phone number: $value");
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
            )
          ],
        ),
        Row(
          children: [
            // 输入验证码
            SizedBox(
              width: 200,
              height: 100,
              child: TextField(
                onChanged: (value) {
                  // print("sms code: $value");
                  setState(() {
                    smsCode = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "sms code",
                  hintText: "sms code",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            // 发送验证码按钮
            TextButton(
                onPressed: isSmsCodeSent
                    ? null
                    : () async {
                        print("点击了发送验证码按钮");
                        bool status = await sendSmsCode(phoneNumber!);
                        setState(() {
                          isSmsCodeSent = status;
                        });
                      },
                child: isSmsCodeSent ? Text("已发送") : Text("发送验证码"))
          ],
        ),
        ElevatedButton(
            onPressed: () async {
              print("点击了登录按钮. $phoneNumber--$smsCode");
              String token = await loginPhoneCode({
                "area_code": "86",
                "phone_number": phoneNumber,
                "sms_code": smsCode
              });
              if (token != null) {
                print("登录成功: token: $token");
                writeToken(token);
                Navigator.pushNamed(context, "/space");
              } else {
                print("登录失败");
              }
            },
            child: const Text("登录"))
      ],
    );
  }
}

/// 第三方登录widget
class OAuthWidget extends StatelessWidget {
  const OAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Divider(),
        // 支持的oauth2的登录方式
        IconButton(
          onPressed: () {
            print("点击了微信登录");
          },
          icon: const Icon(OAuth2Icon.wechat, size: 50),
        ),
        IconButton(
            onPressed: () {
              print("点击了QQ登录");
            },
            icon: const Icon(
              OAuth2Icon.google,
              size: 50,
            )),
        IconButton(
            onPressed: () {
              print("点击了微博登录");
            },
            icon: const Icon(OAuth2Icon.apple, size: 50)),
      ],
    );
  }
}
