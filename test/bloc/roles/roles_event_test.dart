import 'package:admin_web_portal/bloc/Roles/roles_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RolesEvent', (){
    test('RolesLoaded', (){
      expect(RolesLoaded().toString(), 'RolesLoaded()');
    });
  });
}