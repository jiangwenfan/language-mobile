import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:dio/io.dart';
import 'dart:io';
import '../utils/network.dart';

// 使用邮箱和密码进行登录。
// 登录成功返回 String token
// 登录失败返回 Sting ""
Future<String> loginEmailPassword(Map<String, dynamic> data) async {
  var dio = createDio();
  Response response;
  try {
    response = await dio.post(
      "$homeUrl/users/login-email-password/",
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json", // 设置请求头为 application/json
        },
      ),
    );
    // logger.d("邮箱密码登录数据: $data");
  } on DioException catch (e) {
    // 状态码:${response.code}
    logger.e("邮箱密码登录失败: 响应:${e.response.toString()}");
    return "";
  } finally {
    logger.d("邮箱密码登录数据: $data");
    dio.close();
  }

  int? code = response.statusCode;
  Map res = response.data;

  // code是200,且 token字段存在响应中
  if (code == 200 && res.containsKey("token")) {
    String token = res["token"];
    logger.i("登录成功: token: $token");
    return token;
  }
  logger.i("登录失败: code: $code, res: $res");
  return "";
}

// 使用`手机号`和`验证码`登录。
// 登录成功返回 String token
// 登录失败返回 Sting ""
Future<String> loginPhoneCode(Map data) async {
  var dio = createDio();
  Response response;
  try {
    response = await dio.post("$homeUrl/users/login-phone-sms/", data: data);
  } on DioException catch (e) {
    logger.e("手机号验证码登录失败: 响应:${e.response.toString()}");
    return "";
  } finally {
    logger.d("手机号验证码登录数据: $data");
    dio.close();
  }

  int? code = response.statusCode;
  Map res = response.data;

  // code是200,且 token字段存在响应中
  if (code == 200 && res.containsKey("token")) {
    String token = res["token"];
    logger.i("登录成功: token: $token");
    return token;
  }
  logger.i("登录失败: code: $code, res: $res");
  return "";
}
