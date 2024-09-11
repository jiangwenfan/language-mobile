import 'package:flutter/material.dart';

import '../utils/network.dart';
import 'package:dio/dio.dart';

/// - 获取用户所有的空间.
/// 成功返回 List<Map>. map有id,use_language,learn_language
/// 失败返回 []
Future<List> getUserAllSpaces() async {
  var response;
  var dio;

  try {
    // 读取token传递
    // String token = await readToken();
    // if (token == "") {
    //   logger.e("获取token失败,token为空");
    //   return [];
    // }
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4MTgyMDg3LCJpYXQiOjE3MjU1OTAwODcsImp0aSI6ImM0NWIxYTM0MDM4YzRiNmY5NTY5M2EzMmY4MDBiZDJlIiwidXNlcl9pZCI6MX0.8iKnf4crVRoE5l2RE9pm6CB0d3GnjZku2z7RteuHs2s";

    // 从token中解析出用户id
    Map tokenMap = await parseToken(token);
    int userId = tokenMap["user_id"];

    dio = createDio(token: token);

    String url = "$homeUrl/users/$userId/study-spaces/";
    logger.d("url: $url");
    response = await dio.get(url);
  } on DioException catch (e) {
    logger.e("获取用户所有空间失败: 响应:${e.response.toString()}");
    return [];
  } finally {
    dio.close();
  }

  int? code = response.statusCode;
  // code是200,且 token字段存在响应中
  if (code == 200 &&
      response.data.containsKey("count") &&
      response.data.containsKey("results")) {
    int count = response.data["count"];
    logger.i("获取spaces成功: 获取 $count 个空间");
    return response.data["results"];
  }
  return [];
}

/// 创建用户的学习空间
/// ```json
///
/// ```
Future createSpace(
    {required int useLanguageId, required int learnLanguageId}) async {
  var response;
  var dio;

  try {
    // 读取token传递
    // String token = await readToken();
    // if (token == "") {
    //   logger.e("获取token失败,token为空");
    //   return [];
    // }
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4MTgyMDg3LCJpYXQiOjE3MjU1OTAwODcsImp0aSI6ImM0NWIxYTM0MDM4YzRiNmY5NTY5M2EzMmY4MDBiZDJlIiwidXNlcl9pZCI6MX0.8iKnf4crVRoE5l2RE9pm6CB0d3GnjZku2z7RteuHs2s";

    dio = createDio(token: token);

    // 解析token
    // Map token = await parseToken(token);
    // int userId = token["user_id"];
    int userId = 1;

    response = await dio.post("$homeUrl/users/$userId/study-spaces/", data: {
      "use_language": {"id": useLanguageId},
      "learn_language": {"id": learnLanguageId}
    });
  } on DioException catch (e) {
    logger.e("创建学习空间失败: 响应:${e.response.toString()}");
    return [];
  } finally {
    dio?.close();
  }

  int? code = response.statusCode;
  if (code == 201) {
    logger.w("创建学习空间成功: ${response.data}");
    return response.data;
  }
  return [];
}

// 删除用户空间
Future deleteSpace({required int spaceId}) async {
  var response;
  var dio;

  try {
    // 读取token传递
    String token = await readToken();
    if (token == "") {
      logger.e("获取token失败,token为空");
      return [];
    }

    dio = createDio(token: token);

    // 解析token
    // Map token = await parseToken(token);
    // int userId = token["user_id"];
    int userId = 1;

    response =
        await dio.delete("$homeUrl/users/$userId/study-spaces/$spaceId/");
  } on DioException catch (e) {
    logger.e("删除学习空间失败: 响应:${e.response.toString()}");
    return [];
  } finally {
    dio?.close();
  }

  int? code = response.statusCode;
  if (code == 204) {
    logger.i("删除学习空间成功: ${response.data}");
    return response.data;
  }
  return [];
}
