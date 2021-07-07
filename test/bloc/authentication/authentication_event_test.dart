import 'package:admin_web_portal/bloc/authentication/authentication_event.dart';
import 'package:test/test.dart';

void main() {
  group('AuthenticationEvent', () {
    test('AuthenticationAppStarted', () {
      expect(
        AuthenticationAppStarted().toString(),
        'AuthenticationAppStarted()',
      );
    });

    test('AuthenticationLoginAttempted', () {
      expect(
        AuthenticationLoginAttempted('a', 'abc').toString(),
        'AuthenticationLoginAttempted(a, abc)',
      );
    });
  });
}
