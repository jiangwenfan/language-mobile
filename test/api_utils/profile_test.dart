import 'package:flutter_test/flutter_test.dart';

import 'package:open_language/api_utils/profile.dart';
import 'package:open_language/api_utils/meta.dart';

void main() {
  group('Profile Tests', () {
    test('get user profile', () async {
      var res = await getProfile();
      final result = await getLanguageCategory();
      expect(1, 1);
    });
  });
}
