import 'package:flutter_test/flutter_test.dart';
import 'package:open_language/api_utils/utils.dart';

void main() {
  group('utils...', () {
    test('发送验证码-成功', () async {
      final result = await sendSmsCode();
      expect(result, false);
    });
  });
}
