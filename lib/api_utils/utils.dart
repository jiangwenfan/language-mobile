import 'package:flutter/material.dart';
import 'package:open_language/api_utils/login.dart';
import 'package:dio/dio.dart';

import '../utils/network.dart';

/// 发送验证码
/// 发送成功返回true，失败返回false
Future<bool> sendSmsCode(String phoneNumber) async {
  var dio = createDio(token: null);
  var response;

  try {
    response = await dio.post(
      "$homeUrl/users/obtain-sms-code/",
      data: {"area_code": "86", "phone_number": phoneNumber},
      options: Options(
        headers: {
          "Content-Type": "application/json", // 设置请求头为 application/json
        },
      ),
    );
  } on DioException catch (e) {
    logger.e("发送验证码失败: 响应:${e.response.toString()}");
    return false;
  } finally {
    dio.close();
  }

  // int? code = response.statusCode;
  // Map res = response.data;
  // print("--->${response.runtimeType}");

  // code是200,且 token字段存在响应中
  // if (code == 200 && response.containsKey("status")) {
  //   String token = response["token"];
  //   logger.i("登录成功: token: $token");
  //   return token;
  // }
  // logger.i("登录失败: code: $code, res: $response");
  logger.i("发送验证码成功 ${response.statusCode} ${response.data}");
  return true;
}
