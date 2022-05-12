import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_onboarding/src/domain/helpers/helpers.dart';
import 'package:micro_app_onboarding/src/domain/usecases/usecases.dart';
import 'package:micro_app_onboarding/src/presentation/helpers/helpers.dart';
import 'package:micro_app_onboarding/src/presentation/value_notifier_login_presenter.dart';
import 'package:micro_commons_deps/micro_commons_test_deps.dart';

import '../mocks/mocks.dart';

class AuthenticateUserParamsMock extends Mock implements AuthenticateUserParams {}
void main() {
  late ValueNotifierLoginPresenter sut;
  late AuthenticateUserSpy authenticateUserSpy;
  List<UIState> states = [];

  setUpAll(() {
    registerFallbackValue(AuthenticateUserParamsMock());
  });

  setUp(() {
    authenticateUserSpy = AuthenticateUserSpy();
    sut = ValueNotifierLoginPresenter(authenticateUser: authenticateUserSpy);
    sut.init();

    sut.stateNotifier.addListener(() {
      states.add(sut.stateNotifier.value);
    });
  });

  test('Should init notifiers on init method', () async {
    sut.init();
    
    expect(sut.stateNotifier.value, const UIInitialState());
    expect(sut.emailNotifier.value, '');
    expect(sut.passwordNotifier.value, '');
    expect(sut.emailErrorNotifier.value, true);
    expect(sut.passwordErrorNotifier.value, true);
    expect(sut.buttonClickedNotifier.value, false);
  });

  test('Should call authenticate use case on authenticate method', () async {
    final fakeLogin = faker.lorem.word();
    final fakePass = faker.lorem.word();
    sut.passwordErrorNotifier.value = false;
    sut.emailErrorNotifier.value = false;
    sut.emailNotifier.value = fakeLogin;
    sut.passwordNotifier.value = fakePass;

    await sut.authenticate();

    verify(() => authenticateUserSpy.call(AuthenticateUserParams(
      login: fakeLogin,
      password: fakePass
    )));
  });

  test('Should emit correct states on authenticate method success', () async {
    states.clear();
    when(() => authenticateUserSpy.call(any())).thenAnswer((_) => Future.value(null));

    sut.passwordErrorNotifier.value = false;
    sut.emailErrorNotifier.value = false;

    await sut.authenticate();

    expect(states[0], const UILoadingState());
    expect(states[1], const UISuccessState(''));
  });

  test('Should emit correct states on authenticate method invalid credentials', () async {
    states.clear();
    when(() => authenticateUserSpy.call(any())).thenThrow(DomainErrors.invalidCredentials);

    sut.passwordErrorNotifier.value = false;
    sut.emailErrorNotifier.value = false;

    await sut.authenticate();

    expect(states[0], const UILoadingState());
    expect(states[1], const UIErrorState('Verifique seu e-mail e senha'));
  });

  test('Should emit correct states on authenticate method fails unexpectedly', () async {
    states.clear();
    when(() => authenticateUserSpy.call(any())).thenThrow(DomainErrors.unexpected);

    sut.passwordErrorNotifier.value = false;
    sut.emailErrorNotifier.value = false;

    await sut.authenticate();

    expect(states[0], const UILoadingState());
    expect(states[1], const UIErrorState('Não foi possível realizar o login'));
  });

  test('Should set email field on setEmail method', () async {
    final fakeEmail = faker.lorem.word();
    sut.setEmail(fakeEmail);

    expect(sut.emailNotifier.value, fakeEmail);
    expect(sut.emailErrorNotifier.value, fakeEmail.isEmpty);
  });

  test('Should set password field on setPassword method', () async {
    final fakePassword = faker.lorem.word();
    sut.setPassword(fakePassword);

    expect(sut.passwordNotifier.value, fakePassword);
    expect(sut.passwordErrorNotifier.value, fakePassword.isEmpty);
  });

  test('Should dispose notifiers on dispose method', () async {
    sut.init();
    sut.dispose();

    expect(() => sut.stateNotifier.hasListeners, throwsA(isA<FlutterError>()));
    expect(() => sut.emailNotifier.hasListeners, throwsA(isA<FlutterError>()));
    expect(() => sut.passwordNotifier.hasListeners, throwsA(isA<FlutterError>()));
    expect(() => sut.emailErrorNotifier.hasListeners, throwsA(isA<FlutterError>()));
    expect(() => sut.passwordErrorNotifier.hasListeners, throwsA(isA<FlutterError>()));
    expect(() => sut.buttonClickedNotifier.hasListeners, throwsA(isA<FlutterError>()));
  });
}