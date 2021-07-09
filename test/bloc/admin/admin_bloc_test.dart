import 'package:admin_web_portal/bloc/admin/admin_bloc.dart';
import 'package:admin_web_portal/bloc/admin/admin_event.dart';
import 'package:admin_web_portal/bloc/admin/admin_state.dart';
import 'package:admin_web_portal/repository/admin.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock_models.dart';

class MockAdminRepository extends Mock implements AdminRepositoryI{}

void main() {
  group('AdminBloc test', () {
    AdminRepositoryI adminRepository;
    AdminBloc adminBloc;

    setUp(() {
      adminRepository = MockAdminRepository();
      adminBloc = AdminBloc(adminRepository, null);
    });

    blocTest('AdminLoaded - Success',
      build: () {
        when(adminRepository.getAllAdmin()).thenAnswer((_) => Future.value([adminMock]));
        return adminBloc;
      },
      act: (bloc) => bloc.add(AdminLoaded()),
      expect: () => [
        AdminLoadInProgress(),
        AdminLoadSuccess([adminMock])
      ],
    );

    blocTest('AdminLoaded - Failure',
      build: () {
        when(adminRepository.getAllAdmin()).thenAnswer((_) => Future.value(null));
        return adminBloc;
      },
      act: (bloc) => bloc.add(AdminLoaded()),
      expect: () => [
        AdminLoadInProgress(),
        AdminLoadFailure()
      ],
    );
    /*blocTest('AdminCreated - Success',
      build: () {
        when(adminRepository.getAllAdmin()).thenAnswer((_) => Future.value([adminMock]));
        when(adminRepository.createAdmin(createAdminMock)).thenAnswer((_) => Future.value(true));
        return adminBloc;
      },
      act: (bloc) => bloc..add(AdminLoaded())..add(AdminCreated(createAdminMock)),
      expect: () => [
        AdminLoadInProgress(),
      ],
    );*/

    blocTest('AdminCreated - failure',
      build: () {
        when(adminRepository.createAdmin(createAdminMock)).thenAnswer((_) => Future.value(false));
        return adminBloc;
      },
      act: (bloc) => bloc.add(AdminCreated(createAdminMock)),
      expect: () => [
        AdminLoadInProgress(),
        null
      ],
    );

  });
}