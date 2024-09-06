import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:dio/io.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

var homeUrl = "https://host.open-language.space:9080";
var logger = Logger();

// 取消证书验证的Dio实例
Dio createDio() {
  var dio = Dio();
  // 自定义 HttpClientAdapter 来忽略 SSL 证书验证
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  return dio;
}

// 写入token
Future<void> writeToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
  logger.i("写入token成功: $token");
}

// 读取token
// 读取成功返回 含有Bearer前缀的token
// 读取失败返回 ""
Future<String> readToken() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  logger.i("读取token成功: $token");
  return token ?? "";
}

// 解析token
Future<Map> parseToken(String token) async {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid JWT token');
  }

  final payload = parts[1];
  final normalizedPayload = base64Url.normalize(payload);
  final payloadString = utf8.decode(base64Url.decode(normalizedPayload));

  var data = json.decode(payloadString);
  logger.i("解析token成功: $data");
  return data;
}
