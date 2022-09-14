import 'package:bloc_test/bloc_test.dart';
import 'package:enviro_bank/src/bloc/init/init_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'init_cubit_test.mocks.dart';

@GenerateMocks([InitService])
void main() {
  group('InitCubit', () {
    late InitService service;
    late InitCubit cubit;
    setUp(() {
      service = MockInitService();
      cubit = InitCubit(service: service);
    });

    test('should emit as initial state', () {
      expect(cubit.state, InitInitialState());
    });

    blocTest(
      'should emit SignedInState when jwtToken not null',
      build: () {
        when(service.getJwtToken()).thenAnswer(
          (realInvocation) => Future.value('asdadadadwebpoemtpmbnyepdm'),
        );
        return cubit;
      },
      act: (InitCubit cubit) async {
        await cubit.initialize();
      },
      expect: () => <InitState>[
        const SignedInState(jwtToken: 'asdadadadwebpoemtpmbnyepdm'),
      ],
    );
    blocTest(
      'should emit SignedOutState when jwtToken is null',
      build: () {
        when(service.getJwtToken()).thenAnswer(
          (realInvocation) => Future.value(null),
        );
        return cubit;
      },
      act: (InitCubit cubit) async{
        await cubit.initialize();
      },
      expect: () => <InitState>[
        const SignedOutState(),
      ],
    );
  });
}
