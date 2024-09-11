import '../utils/network.dart';
import 'package:dio/dio.dart';

// 获取用户配置信息
Future<Map> getProfile() async {
  var dio;
  var response;
  try {
    // 读取token传递
    // String token = await readToken();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4MTgyMDg3LCJpYXQiOjE3MjU1OTAwODcsImp0aSI6ImM0NWIxYTM0MDM4YzRiNmY5NTY5M2EzMmY4MDBiZDJlIiwidXNlcl9pZCI6MX0.8iKnf4crVRoE5l2RE9pm6CB0d3GnjZku2z7RteuHs2s";
    if (token == "") {
      logger.e("获取token失败,token为空");
      return {};
    }
    var dio = createDio(token: token);

    // 解析token
    // Map token = await parseToken(token);
    // int profileId = token["profile_id"];
    int profileId = 1;

    response = await dio.get("$homeUrl/profiles/$profileId");
    // response = await dio.get("$homeUrl/languages/");
  } on DioException catch (e) {
    logger.e("获取用户配置信息失败: 响应:${e.response.toString()}");
    return {};
  } finally {
    dio?.close();
  }
  int? code = response.statusCode;

  // code是200,且 token字段存在响应中
  if (code == 200) {
    logger.i("获取profile成功: 获取 ${response.data} 个空间");
    return response.data;
  }
  return {};
}


// TODO 获取用户的 document 资源

// TODO 获取用户的 article 资源