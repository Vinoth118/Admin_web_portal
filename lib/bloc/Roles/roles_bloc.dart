import 'package:admin_web_portal/bloc/Roles/roles_event.dart';
import 'package:admin_web_portal/bloc/Roles/roles_state.dart';
import 'package:admin_web_portal/repository/roles.dart';
import 'package:admin_web_portal/router/navigator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState>{
  final RolesRepositoryI _rolesRepository;
  final NavigatorService _navigatorService;
  RolesLoadSuccess _lastSuccessState;

  RolesBloc(this._rolesRepository, this._navigatorService) : super(RolesInitial());

  @override
  Stream<RolesState> mapEventToState(RolesEvent event) async* {
    if(event is RolesLoaded) {
      yield* _mapRolesLoadedToState(event);
    }
  }

  Stream<RolesState> _mapRolesLoadedToState(RolesLoaded event) async* {
    yield RolesLoadInProgress();
    await Future.delayed(Duration(seconds: 1));
    final result = await _rolesRepository.getAllRoles();
    print('from bloc $result');
    if (result != null) {
      _lastSuccessState = RolesLoadSuccess(result);
      yield _lastSuccessState;
    } else {
      yield RolesLoadFailure();
    }
  }

}