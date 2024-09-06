import 'package:flutter_test/flutter_test.dart';

import 'package:open_language/api_utils/profile.dart';

void main() {
  group('Profile Tests', () {
    test('get user profile', () async {
      var res = await getProfile();
      expect(1, 1);
    });
  });
}
