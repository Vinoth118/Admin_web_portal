import 'package:admin_web_portal/bloc/admin/admin_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('AdminState', () {
    test('AdminInitial', () {
      expect(
        AdminInitial().toString(),
        'AdminInitial()',
      );
    });
    test('AdminLoadSuccess', () {
      expect(
        AdminLoadSuccess([adminMock]).toString(),
        'AdminLoadSuccess(${[adminMock]})',
      );
    });
    test('AdminLoadInProgress', () {
      expect(
        AdminLoadInProgress().toString(),
        'AdminLoadInProgress()',
      );
    });
    test('AdminLoadFailure', () {
      expect(
        AdminLoadFailure(message: 'Something went wrong').toString(),
        'AdminLoadFailure(Something went wrong)',
      );
    });
  });
}
