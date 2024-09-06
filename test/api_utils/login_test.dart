import 'package:flutter_test/flutter_test.dart';
import 'package:open_language/api_utils/login.dart';

void main() {
  group('MathUtils Tests', () {
    test('邮箱密码-成功登录', () async {
      final result = await loginEmailPassword(
          {"email": "zhan2103208467@gmail.com", "password": "admin123K#"});

      // token是string类型
      expect(result, isA<String>());
      // token长度大于1
      expect(result.length, greaterThan(1));
    });

    test("邮箱密码-失败登录", () async {
      final result = await loginEmailPassword({"email": "", "password": ""});
      // 登录失败返回 ""
      expect(result, "");
    });

    test("手机号验证码-成功登录", () async {
      final res = await loginPhoneCode({
        "area_code": "86",
        "phone_number": "18285574257",
        "sms_code": "6472"
      });
      expect(res, "");
    });
  });
}
