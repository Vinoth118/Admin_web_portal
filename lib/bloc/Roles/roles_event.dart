import 'package:admin_web_portal/models/role/create_role.dart';
import 'package:equatable/equatable.dart';

abstract class RolesEvent extends Equatable{ }

class RolesLoaded extends RolesEvent{

  RolesLoaded();

  @override
  List<Object> get props => [];

}
class RoleCreated extends RolesEvent {

  RoleCreated(this.role);

  final CreateRole role;

  @override
  List<Object> get props => [role];

}