import 'package:admin_web_portal/components/side_menu_modal/side_menu_modal.dart';
import 'package:equatable/equatable.dart';

abstract class SideMenuState extends Equatable {}

class SideMenuInitial extends SideMenuState {

  SideMenuInitial();
  @override
  List<Object> get props => [];
}

class SideMenuLoadSuccess extends SideMenuState {

  SideMenuLoadSuccess(this.option);
  final List<SideMenuModal> option;

  @override
  List<Object> get props => [option];
}