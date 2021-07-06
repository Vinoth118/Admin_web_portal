import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SideMenuModal extends Equatable {

  bool isSelected;
  String option;

  SideMenuModal({this.isSelected, this.option});

  @override
  List<Object> get props => [isSelected, option];

}