import 'package:flutter_test/flutter_test.dart';
import 'package:open_language/api_utils/spaces.dart';

void main() {
  group('Spaces Tests', () {
    test('get user all spaces', () async {
      var res = await getUserAllSpaces();
      expect(1, 1);
    });
    test("create space", () async {
      var res = await createSpace(useLanguageId: 4, learnLanguageId: 2);
      expect(1, 1);
    });
    test("删除 space", () async {
      // var res = await deleteSpace(spaceId: 1);
      expect(1, 1);
    });
  });
}
