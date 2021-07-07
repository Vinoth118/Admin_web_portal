import 'package:admin_web_portal/bloc/authentication/authentication_state.dart';
import 'package:admin_web_portal/models/profile.dart';
import 'package:test/test.dart';

void main() {
  group('AuthenticationState', () {
    test('AuthenticationInitial', () {
      expect(
        AuthenticationInitial().toString(),
        'AuthenticationInitial()',
      );
    });

    test('AuthenticationLoadInProgresss', () {
      expect(
        AuthenticationLoadInProgresss().toString(),
        'AuthenticationLoadInProgresss()',
      );
    });
    test('AuthenticationLoadSuccess', () {
      expect(
        AuthenticationLoadSuccess(Profile()).toString(),
        'AuthenticationLoadSuccess(Profile(null))',
      );
    });
    test('AuthenticationFailure', () {
      expect(
        AuthenticationFailure("something went wrong").toString(),
        'AuthenticationFailure(something went wrong)',
      );
    });
  });
}
