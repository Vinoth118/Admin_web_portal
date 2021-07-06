
import 'package:admin_web_portal/models/role.dart';
import 'package:equatable/equatable.dart';

abstract class RolesState extends Equatable {}

class RolesInitial extends RolesState {
  RolesInitial();

  @override
  List<Object> get props => [];
}

class RolesLoadSuccess extends RolesState {
  RolesLoadSuccess(this.roles);

  final List<Role> roles;

  @override
  List<Object> get props => [roles];
}

class RolesLoadInProgress extends RolesState {
  RolesLoadInProgress();

  @override
  List<Object> get props => [];
}

class RolesLoadFailure extends RolesState {
  RolesLoadFailure({this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
