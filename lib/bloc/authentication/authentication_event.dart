import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class AuthenticationAppStarted extends AuthenticationEvent {
  AuthenticationAppStarted();

  @override
  List<Object> get props => [];
}

class AuthenticationLoginAttempted extends AuthenticationEvent {
  final String username, password;

  AuthenticationLoginAttempted(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
