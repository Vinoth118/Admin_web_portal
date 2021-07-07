import 'package:admin_web_portal/bloc/authentication/authentication_bloc.dart';
import 'package:admin_web_portal/bloc/authentication/authentication_event.dart';
import 'package:admin_web_portal/bloc/authentication/authentication_state.dart';
import 'package:admin_web_portal/repository/authentication.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mock_models.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepositoryI {}

void main() {
  group('AuthenticationBloc', () {
    AuthenticationBloc authenticationBloc;
    AuthenticationRepositoryI authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      authenticationBloc = AuthenticationBloc(authenticationRepository, null);
    });

    blocTest(
      'AuthenticationLoginAttempted - success',
      build: () {
        when(authenticationRepository.login('username', 'password'))
            .thenAnswer((_) => Future.value(profileMock));

        return authenticationBloc;
      },
      act: (bloc) =>
          bloc.add(AuthenticationLoginAttempted('username', 'password')),
      expect: () => [
        AuthenticationLoadSuccess(profileMock),
      ],
    );
  });
}
