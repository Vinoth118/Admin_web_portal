import 'package:admin_web_portal/components/bloc/side_menu/side_menu_event.dart';
import 'package:admin_web_portal/components/bloc/side_menu/side_menu_state.dart';
import 'package:admin_web_portal/components/side_menu_modal/side_menu_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  SideMenuBloc(SideMenuState initialState) : super(SideMenuInitial());

  @override
  Stream<SideMenuState> mapEventToState(SideMenuEvent event) async* {
    if (event is OptionSelected) {
      yield* _mapOptionSelectedToState(event);
    }
  }

  Stream<SideMenuState> _mapOptionSelectedToState(OptionSelected event) async* {
    List<SideMenuModal> options = [
      SideMenuModal(isSelected: false, option: 'dashboard'),
      SideMenuModal(isSelected: false, option: 'roles'),
      SideMenuModal(isSelected: false, option: 'admin'),
    ];
    switch (event.option) {
      case 'dashboard':
        List<SideMenuModal> temp = List.from(options);
        temp[0].isSelected = event.isSelected;
        yield SideMenuLoadSuccess(temp);
        break;
      case 'roles':
        List<SideMenuModal> temp = List.from(options);
        temp[1].isSelected = event.isSelected;
        yield SideMenuLoadSuccess(temp);
        break;
      case 'admin':
        List<SideMenuModal> temp = List.from(options);
        temp[2].isSelected = event.isSelected;
        yield SideMenuLoadSuccess(temp);
    }
  }
}
