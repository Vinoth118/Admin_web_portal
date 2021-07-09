
import 'package:admin_web_portal/bloc/admin/admin_event.dart';
import 'package:admin_web_portal/bloc/admin/admin_state.dart';
import 'package:admin_web_portal/repository/admin.dart';
import 'package:admin_web_portal/router/navigator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AdminBloc extends Bloc<AdminEvent, AdminState>{
  final AdminRepositoryI _adminRepository;
  final NavigatorService _navigatorService;
  AdminLoadSuccess _lastSuccessState;

  AdminBloc(this._adminRepository, this._navigatorService) : super(AdminInitial());

  @override
  Stream<AdminState> mapEventToState(AdminEvent event) async* {
    if(event is AdminLoaded) {
      yield* _mapAdminLoadedToState(event);
    } else if(event is AdminCreated) {
      yield* _mapCreateAdminToState(event);
    } /*else if(event is AdminRoleChanged) {
      yield* _mapAdminRoleChanged(event);
    }*/
  }

  Stream<AdminState> _mapAdminLoadedToState(AdminLoaded event) async* {
    yield AdminLoadInProgress();
    await Future.delayed(Duration(seconds: 1));
    final result = await _adminRepository.getAllAdmin();
    //print(result);
    if (result != null) {
      _lastSuccessState = AdminLoadSuccess(result);
      yield _lastSuccessState;
    } else {
      yield AdminLoadFailure();
    }
  }

  Stream<AdminState> _mapCreateAdminToState(AdminCreated event) async* {
    yield AdminLoadInProgress();
    final result = await _adminRepository.createAdmin(event.admin);
    if (result) {
      add(AdminLoaded());
      this._navigatorService.goBack();
    } else {
      yield _lastSuccessState;
    }
  }


}