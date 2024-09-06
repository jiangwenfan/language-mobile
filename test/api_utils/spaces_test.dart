import 'package:flutter_test/flutter_test.dart';
import 'package:open_language/api_utils/spaces.dart';

void main() {
  group('Spaces Tests', () {
    test('get user all spaces', () async {
      var res = await getUserAllSpaces();
      expect(1, 1);
    });
  });
}
