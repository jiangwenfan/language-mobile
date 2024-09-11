import 'package:flutter_test/flutter_test.dart';
import 'package:open_language/api_utils/meta.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); // 初始化Flutter绑定
  group("test meta", () {
    test("test getAllLanguages", () async {
      // const String mockToken = String.fromEnvironment('mock_token');
      // final result = await getAllLanguageCategory(testToken: mockToken);
      final result = await getLanguageCategory();
      expect(result, isA<List>());
    });
  });
}
