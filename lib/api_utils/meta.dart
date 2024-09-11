import '../utils/network.dart';
import 'package:dio/dio.dart';

/// - 获取所有支持的语言
///   - 成功返回 List<Map>. map有id,name,code
///   - 失败返回 []
/// testToken: 测试时,传入的token
Future<List> getLanguageCategory() async {
  var dio;
  var response;

  try {
    // 读取token传递
    // String token = await readToken();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4MTgyMDg3LCJpYXQiOjE3MjU1OTAwODcsImp0aSI6ImM0NWIxYTM0MDM4YzRiNmY5NTY5M2EzMmY4MDBiZDJlIiwidXNlcl9pZCI6MX0.8iKnf4crVRoE5l2RE9pm6CB0d3GnjZku2z7RteuHs2s";
    if (token == "") {
      logger.e("获取token失败,token为空");
      return [];
    }

    dio = createDio(token: token);

    response = await dio.get("$homeUrl/languages/");
    // response = await dio.get("$homeUrl/profiles/$profileId");
  } on DioException catch (e) {
    logger.e(
        "获取所有支持的语言失败: code:${e.response?.statusCode} 响应:${e.response.toString()} d:${response.toString()}");
    return [];
  } finally {
    dio?.close();
  }

  int? code = response.statusCode;
  if (code == 200 && response.data.containsKey("count")) {
    int count = response.data["count"];
    logger.w("获取所有支持的语言成功: ${response.data}");
    logger.i("获取所有支持的语言成功: 获取 $count 个语言");
    return response.data["results"];
  }
  return [];
}
