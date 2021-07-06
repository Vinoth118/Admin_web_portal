import 'package:equatable/equatable.dart';

abstract class RolesEvent extends Equatable{ }

class RolesLoaded extends RolesEvent{

  RolesLoaded();

  @override
  List<Object> get props => [];

}