import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_onboarding/src/domain/entities/user_entity.dart';
import 'package:micro_app_onboarding/src/domain/helpers/helpers.dart';
import 'package:micro_app_onboarding/src/presentation/helpers/helpers.dart';
import 'package:micro_app_onboarding/src/presentation/presentation.dart';
import 'package:micro_commons_deps/micro_commons_test_deps.dart';

import '../mocks/mocks.dart';

class UserEntityMock extends Mock implements UserEntity {}
void main() {
  late ValueNotifierRegisterUserPresenter sut;
  late RegisterUserSpy registerUserSpy;
  final List<UIState> states = [];

  setUpAll(() {
    registerFallbackValue(UserEntityMock());
  });

  setUp(() {
    registerUserSpy = RegisterUserSpy();
    sut = ValueNotifierRegisterUserPresenter(
      registerUser: registerUserSpy
    );
    
    sut.init();
    sut.stateNotifier.addListener(() {
      states.add(sut.stateNotifier.value);
    });
  });

  Map<UserFields, bool> makeNoErrorsMap() => {
    UserFields.email: false,
    UserFields.name: false,
    UserFields.phoneNumber: false,
    UserFields.password: false
  };
  
  test('Should init notifiers on init method', () async {
    sut.init();

    expect(sut.userNotifier.value, isA<UserEntity>());
    expect(sut.stateNotifier.value, const UIInitialState());
    expect(sut.buttonClickedNotifier.value, false);
    expect(sut.fieldErrorsMapNotifier.value, {
      UserFields.email: true,
      UserFields.name: true,
      UserFields.phoneNumber: true,
      UserFields.password: true
    });
  });

  test('Should set buttonClicked on register method', () async {
    sut.register();

    expect(sut.buttonClickedNotifier.value, true);
  });

  test('Should call register use case on register method', () async {
    sut.fieldErrorsMapNotifier.value = makeNoErrorsMap();

    await sut.register();

    verify(() => registerUserSpy.call(sut.user));
  });

  test('Should emit correct states on register method success', () async {
    states.clear();
    when(() => registerUserSpy.call(any())).thenAnswer((_) => Future.value(null));
    sut.fieldErrorsMapNotifier.value = makeNoErrorsMap();

    await sut.register();

    expect(states[0], const UILoadingState());
    expect(states[1], const UISuccessState('Usuário cadastrado com sucesso'));
  });

  test('Should emit correct states on register method when use case throws invalidEmail', () async {
    states.clear();
    when(() => registerUserSpy.call(any())).thenThrow(DomainErrors.invalidEmail);
    sut.fieldErrorsMapNotifier.value = makeNoErrorsMap();

    await sut.register();

    expect(states[0], const UILoadingState());
    expect(states[1], const UIErrorState('Email inválido'));
  });

  test('Should emit correct states on register method when use case throws weakPassword', () async {
    states.clear();
    when(() => registerUserSpy.call(any())).thenThrow(DomainErrors.weakPassword);
    sut.fieldErrorsMapNotifier.value = makeNoErrorsMap();

    await sut.register();

    expect(states[0], const UILoadingState());
    expect(states[1], const UIErrorState('Sua senha está muito fraca, ela deve ter pelo menos 6 caracteres'));
  });

  test('Should emit correct states on register method fails unexpectedly', () async {
    states.clear();
    when(() => registerUserSpy.call(any())).thenThrow(DomainErrors.unexpected);
    sut.fieldErrorsMapNotifier.value = makeNoErrorsMap();

    await sut.register();

    expect(states[0], const UILoadingState());
    expect(states[1], const UIErrorState('Erro inesperado ao cadastrar usuário'));
  });

  test('Should dispose notifiers on dispose method', () async {
    sut.init();
    sut.dispose();

    expect(() => sut.stateNotifier.hasListeners, throwsA(isA<FlutterError>()));
    expect(() => sut.userNotifier.hasListeners, throwsA(isA<FlutterError>()));
    expect(() => sut.buttonClickedNotifier.hasListeners, throwsA(isA<FlutterError>()));
    expect(() => sut.fieldErrorsMapNotifier.hasListeners, throwsA(isA<FlutterError>()));
  });
}