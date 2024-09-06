import 'package:flutter_test/flutter_test.dart';
import 'package:open_language/utils/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // 初始化Flutter绑定
  group("network test", () {
    test("写入-成功", () async {
      // 初始化SharedPreferences的mock
      SharedPreferences.setMockInitialValues({});

      await writeToken("123");
      String token = await readToken();
      expect(token, "123");
    });

    test("解析token-成功", () async {
      String token =
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4MTgyMDg3LCJpYXQiOjE3MjU1OTAwODcsImp0aSI6ImM0NWIxYTM0MDM4YzRiNmY5NTY5M2EzMmY4MDBiZDJlIiwidXNlcl9pZCI6MX0.8iKnf4crVRoE5l2RE9pm6CB0d3GnjZku2z7RteuHs2s";
      Map res = await parseToken(token);
      expect(res["user_id"], 1);
    });
  });
}
