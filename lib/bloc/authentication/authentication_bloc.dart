import 'dart:convert';

import 'package:admin_web_portal/bloc/authentication/authentication_event.dart';
import 'package:admin_web_portal/bloc/authentication/authentication_state.dart';
import 'package:admin_web_portal/models/profile.dart';
import 'package:admin_web_portal/repository/authentication.dart';
import 'package:admin_web_portal/utils/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepositoryI _authenticationRepository;
  final SharedPreferencesUtil sharedPreferencesUtil;

  AuthenticationBloc(this._authenticationRepository, this.sharedPreferencesUtil)
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationLoginAttempted) {
      yield* _mapAuthenticationLoginAttemptedToState(event);
    } else if (event is AuthenticationAppStarted) {
      yield* _mapAuthenticationAppStartedToState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationAppStartedToState() async* {
    final token = sharedPreferencesUtil.instance
        .getString(SharedPreferencesUtil.AUTH_TOKEN);
    if (token != null) {
      final profile = sharedPreferencesUtil.instance
          .getString(SharedPreferencesUtil.PROFILE);
      yield AuthenticationLoadSuccess(Profile.fromJson(json.decode(profile)));
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoginAttemptedToState(
      AuthenticationLoginAttempted event) async* {
    final result =
        await _authenticationRepository.login(event.username, event.password);
    print(result);
    if (result != null) {
      yield AuthenticationLoadSuccess(result);
    } else {
      yield AuthenticationFailure('Something went wrong!');
    }
  }
}
