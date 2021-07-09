import 'package:admin_web_portal/components/bloc/side_menu/side_menu_bloc.dart';
import 'package:admin_web_portal/components/bloc/side_menu/side_menu_event.dart';
import 'package:admin_web_portal/components/bloc/side_menu/side_menu_state.dart';
import 'package:admin_web_portal/components/side_menu_modal/side_menu_modal.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SideMenuBloc test', () {
    SideMenuBloc sideMenuBloc;

    setUp(() {
      sideMenuBloc = SideMenuBloc(SideMenuInitial());
    });

    blocTest('OptionSelected - dashboard',
        build: () {
          return sideMenuBloc;
        },
        act: (bloc) => bloc.add(OptionSelected(true, 'dashboard')),
        expect: () => [
              SideMenuLoadSuccess([
                SideMenuModal(isSelected: true, option: 'dashboard'),
                SideMenuModal(isSelected: false, option: 'roles'),
                SideMenuModal(isSelected: false, option: 'admin'),
              ])
            ]
    );

    blocTest('OptionSelected - roles',
        build: () {
          return sideMenuBloc;
        },
        act: (bloc) => bloc.add(OptionSelected(true, 'roles')),
        expect: () => [
          SideMenuLoadSuccess([
            SideMenuModal(isSelected: false, option: 'dashboard'),
            SideMenuModal(isSelected: true, option: 'roles'),
            SideMenuModal(isSelected: false, option: 'admin'),
          ])
        ]
    );

    blocTest('OptionSelected - admin',
        build: () {
          return sideMenuBloc;
        },
        act: (bloc) => bloc.add(OptionSelected(true, 'admin')),
        expect: () => [
          SideMenuLoadSuccess([
            SideMenuModal(isSelected: false, option: 'dashboard'),
            SideMenuModal(isSelected: false, option: 'roles'),
            SideMenuModal(isSelected: true, option: 'admin'),
          ])
        ]
    );
  });
}
