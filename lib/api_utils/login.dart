import 'package:dio/dio.dart';
import '../utils/network.dart';

/// - 使用`邮箱`和`密码`进行登录
///   - 登录成功: 返回 String token
///   - 登录失败: 返回 Sting ""
/// - 登录的data格式:
/// ```json
/// {
///    "email": "zhan2103208467@gmail.com",
///    "password": "admin123K#"
/// }
/// ```
Future<String> loginEmailPassword(Map<String, dynamic> data) async {
  Dio? dio;
  Response response;
  try {
    dio = createDio(token: null);
    response = await dio.post(
      "$homeUrl/users/login-email-password/",
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json", // 设置请求头为 application/json
        },
      ),
    );
  } on DioException catch (e) {
    logger.e(
        "邮箱密码登录,失败 状态码:${e.response!.statusCode}; \n响应:${e.response.toString()}");
    return "";
  } finally {
    logger.i("邮箱密码登录: request data: $data");
    dio?.close();
  }

  int? code = response.statusCode;
  Map res = response.data;

  // code是200,且 token字段存在响应中
  if (code == 200 && res.containsKey("token")) {
    String token = res["token"];
    logger.i("邮箱密码登录,成功 token: $token");
    return token;
  }
  logger.i("邮箱密码登录,失败 code:$code, res:$res");
  return "";
}

/// - 使用`手机号`和`验证码`登录。
///   - 登录成功返回 String token
///    - 登录失败返回 Sting ""
/// - 登录的data格式:
/// ```json
/// {
///       "area_code": "86",
///        "phone_number": "18285574257",
///        "sms_code": "6472"
/// }
/// ```
Future<String> loginPhoneCode(Map data) async {
  var dio = createDio(token: null);
  Response response;
  try {
    response = await dio.post("$homeUrl/users/login-phone-sms/", data: data);
  } on DioException catch (e) {
    logger.e(
        "手机号验证码登录,失败 code:${e.response?.statusCode} 响应:${e.response.toString()}");
    return "";
  } finally {
    logger.d("手机号验证码登录,数据: $data");
    dio.close();
  }

  int? code = response.statusCode;
  Map res = response.data;

  // code是200,且 token字段存在响应中
  if (code == 200 && res.containsKey("token")) {
    String token = res["token"];
    logger.i("手机号验证码登录,成功: token: $token");
    return token;
  }
  logger.i("手机号验证码登录,失败: code: $code, res: $res");
  return "";
}
