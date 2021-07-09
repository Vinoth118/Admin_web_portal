import 'package:admin_web_portal/models/admin/admin.dart';
import 'package:equatable/equatable.dart';

abstract class AdminState extends Equatable {}

class AdminInitial extends AdminState {
  AdminInitial();

  @override
  List<Object> get props => [];
}

class AdminLoadSuccess extends AdminState {
  AdminLoadSuccess(this.admin);
  final List<Admin> admin;

  @override
  List<Object> get props => [admin];
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
