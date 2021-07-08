import 'package:admin_web_portal/models/admin/admin.dart';
import 'package:admin_web_portal/models/admin/create_admin.dart';
import 'package:equatable/equatable.dart';

abstract class AdminEvent extends Equatable{ }

class AdminLoaded extends AdminEvent{

  AdminLoaded();

  @override
  List<Object> get props => [];

}

class AdminCreated extends AdminEvent {

  AdminCreated(this.admin);

  final CreateAdmin admin;

  @override
  List<Object> get props => [admin];

}

class AdminRoleChanged extends AdminEvent {

  AdminRoleChanged(this.roleId);

  final String roleId;

  @override
  List<Object> get props => [];
}