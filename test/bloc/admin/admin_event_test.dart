

import 'package:admin_web_portal/bloc/admin/admin_event.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('AdminEvent', (){
    test('AdminLoaded', (){
      expect(AdminLoaded().toString(), 'AdminLoaded()');
    });
    test('AdminCreated', (){
      expect(AdminCreated(createAdminMock).toString(), 'AdminCreated($createAdminMock)');
    });
  });
}