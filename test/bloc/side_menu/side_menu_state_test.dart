import 'package:admin_web_portal/components/bloc/side_menu/side_menu_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';

void main() {
  group('SideMenuState test',() {
    test('SideMenuInitial', () {
      expect(SideMenuInitial().toString(), 'SideMenuInitial()');
    });
    test('SideMenuLoadSuccess', () {
      expect(SideMenuLoadSuccess(sideMenuModalMock).toString(), 'SideMenuLoadSuccess($sideMenuModalMock)');
    });
  });
}