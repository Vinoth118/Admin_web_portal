import 'package:admin_web_portal/components/bloc/side_menu/side_menu_event.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_models.dart';
void main() {
  group('SideMenuEvent test', (){
    test('OptionSelected', () {
      expect(OptionSelected(true, 'dashboard').toString(),"OptionSelected($sideMenuIsSelectedMock, $sideMenuOptionMock)");
    });
  });
}