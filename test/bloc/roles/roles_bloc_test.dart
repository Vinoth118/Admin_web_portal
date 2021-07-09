import 'package:admin_web_portal/bloc/roles/roles_bloc.dart';
import 'package:admin_web_portal/bloc/roles/roles_event.dart';
import 'package:admin_web_portal/bloc/roles/roles_state.dart';
import 'package:admin_web_portal/repository/roles.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock_models.dart';

class MockRolesRepository extends Mock implements RolesRepositoryI {}

void main() {
  group('RolesBoc test',(){
    RolesBloc rolesBloc;
    RolesRepositoryI rolesRepository;

    setUp((){
      rolesRepository = MockRolesRepository();
      rolesBloc = RolesBloc(rolesRepository, null);
    });

    blocTest(
        'RolesLoaded - Success',
        build: () {
          when(rolesRepository.getAllRoles()).thenAnswer((_) => Future.value([rolesMock]));
          return rolesBloc;
        },
        act: (bloc) => bloc.add(RolesLoaded()),
        expect: () => [
          RolesLoadInProgress(),
          RolesLoadSuccess([rolesMock])
        ]
    );

    blocTest(
        'RolesLoaded - failure',
        build: () {
          when(rolesRepository.getAllRoles()).thenAnswer((_) => Future.value(null));
          return rolesBloc;
        },
        act: (bloc) => bloc.add(RolesLoaded()),
        expect: () => [
          RolesLoadInProgress(),
          RolesLoadFailure()
        ]
    );

    blocTest('RolesCreated - failure',
      build: () {
        when(rolesRepository.createRole(createRoleMock)).thenAnswer((_) => Future.value(false));
        return rolesBloc;
      },
      act: (bloc) => bloc.add(RoleCreated(createRoleMock)),
      expect: () => [
        RolesLoadInProgress(),
        null
      ],
    );

  });
}