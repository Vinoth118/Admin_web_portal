import 'package:admin_web_portal/models/profile.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial();

  @override
  List<Object> get props => [];
}

class AuthenticationLoadInProgresss extends AuthenticationState {
  AuthenticationLoadInProgresss();

  @override
  List<Object> get props => [];
}

class AuthenticationLoadSuccess extends AuthenticationState {
  AuthenticationLoadSuccess(this.profile);

  final Profile profile;

  @override
  List<Object> get props => [profile];
}

class AuthenticationFailure extends AuthenticationState {
  AuthenticationFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
