import 'package:admin_web_portal/bloc/Roles/roles_event.dart';
import 'package:admin_web_portal/bloc/roles/roles_bloc.dart';
import 'package:admin_web_portal/bloc/roles/roles_state.dart';
import 'package:admin_web_portal/repository/roles.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock_models.dart';

class MockRolesRepository extends Mock implements RolesRepositoryI {}

void main() {
  group('RolesBloc', () {
    RolesBloc rolesBloc;
    RolesRepositoryI rolesRepository;

    setUp(() {
      rolesRepository = MockRolesRepository();
      rolesBloc = RolesBloc(rolesRepository, null);
    });

    blocTest(
      'RolesLoaded - success',
      build: () {
        when(rolesRepository.getAllRoles())
            .thenAnswer((_) => Future.value([rolesMock]));

        return rolesBloc;
      },
      act: (bloc) => bloc.add(RolesLoaded()),
      expect: () =>
      [
        RolesLoadInProgress(),
        RolesLoadSuccess([rolesMock])
      ],
    );

    blocTest(
      'RolesLoaded - failure',
      build: () {
        when(rolesRepository.getAllRoles())
            .thenAnswer((_) => Future.value(null));

        return rolesBloc;
      },
      act: (bloc) => bloc.add(RolesLoaded()),
      expect: () =>
      [
        RolesLoadInProgress(),
        RolesLoadFailure(),
      ],
    );
  });
}