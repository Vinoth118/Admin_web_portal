import 'package:admin_web_portal/bloc/roles/roles_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('RolesState', () {
    test('RolesInitial', () {
      expect(
        RolesInitial().toString(),
        'RolesInitial()',
      );
    });
    test('RolesLoadSuccess', () {
      expect(
        RolesLoadSuccess([rolesMock]).toString(),
        'RolesLoadSuccess(${[rolesMock]})',
      );
    });
    test('RolesLoadInProgress', () {
      expect(
        RolesLoadInProgress().toString(),
        'RolesLoadInProgress()',
      );
    });
    test('RolesLoadFailure', () {
      expect(
        RolesLoadFailure(message: 'Something went wrong').toString(),
        'RolesLoadFailure(Something went wrong)',
      );
    });
  });
}
