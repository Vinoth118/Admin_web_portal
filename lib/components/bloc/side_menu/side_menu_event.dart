import 'package:equatable/equatable.dart';

abstract class SideMenuEvent extends Equatable {}

class OptionSelected extends SideMenuEvent {

  OptionSelected(this.isSelected, this.option);

  final bool isSelected;
  final String option;

  @override
  List<Object> get props => [isSelected, option];

}