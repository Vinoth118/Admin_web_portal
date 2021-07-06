import 'package:admin_web_portal/models/admin.dart';
import 'package:equatable/equatable.dart';

abstract class AdminState extends Equatable {}

class AdminInitial extends AdminState {
  AdminInitial();

  @override
  List<Object> get props => [];
}

class AdminLoadSuccess extends AdminState {
  AdminLoadSuccess(this.admin, {this.selectedRole});

  AdminLoadSuccess copyWith({List<Admin> admin, Admin selectedRole}) =>
      AdminLoadSuccess(admin ?? this.admin,
          selectedRole: selectedRole ?? this.selectedRole);
  final List<Admin> admin;
  final Admin selectedRole;

  @override
  List<Object> get props => [admin, selectedRole];
}

class AdminLoadInProgress extends AdminState {
  AdminLoadInProgress();

  @override
  List<Object> get props => [];
}

class AdminLoadFailure extends AdminState {
  AdminLoadFailure({this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
