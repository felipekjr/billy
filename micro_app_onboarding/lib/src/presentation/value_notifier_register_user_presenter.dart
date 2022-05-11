import 'package:flutter/widgets.dart';
import 'package:micro_app_onboarding/src/domain/helpers/domain_errors.dart';
import 'package:micro_app_onboarding/src/presentation/helpers/user_fields.dart';
import 'package:micro_app_onboarding/src/presentation/helpers/ui_state.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';

import '../domain/entities/user_entity.dart';
import '../domain/usecases/register_user.dart';
import '../ui/pages/register_user/register_user.dart';

class ValueNotifierRegisterUserPresenter implements RegisterUserPresenter {
  final RegisterUser registerUser;

  ValueNotifierRegisterUserPresenter({
    required this.registerUser
  });

  @override
  late ValueNotifier<UIState> stateNotifier;

  @override
  late ValueNotifier<UserEntity> userNotifier;

  @override  
  late ValueNotifier<Map<UserFields, bool>> fieldErrorsMapNotifier;

  @override
  late ValueNotifier<bool> buttonClickedNotifier;

  UserEntity get user => userNotifier.value;
  bool get isFormValid => fieldErrorsMapNotifier.value.values.every((v) => v == false);

  @override
  void init() {
    stateNotifier = ValueNotifier(const UIInitialState());
    userNotifier = ValueNotifier(UserEntity.empty());
    buttonClickedNotifier = ValueNotifier(false);
    fieldErrorsMapNotifier = ValueNotifier({
      UserFields.email: true,
      UserFields.name: true,
      UserFields.phoneNumber: true,
      UserFields.password: true
    });
  }
  
  @override
  void register() async {
    try {
      buttonClickedNotifier.value = true;
      if (isFormValid) {
        stateNotifier.value = const UILoadingState();
        await Future.delayed(const Duration(seconds: 1));
        await registerUser(userNotifier.value);
        stateNotifier.value = const UISuccessState('Usuário cadastrado com sucesso');
      }
    } catch (e) {
      if (e == DomainErrors.invalidEmail) {
        stateNotifier.value = const UIErrorState('Email inválido');
      } else if (e == DomainErrors.weakPassword) {
        stateNotifier.value = const UIErrorState('Sua senha está muito fraca, ela deve ter pelo menos 6 caracteres');
      } else {
        stateNotifier.value = const UIErrorState('Erro inesperado ao cadastrar usuário');
      }
    }
  }

  @override
  void validateField(UserFields field, dynamic value) {
    if (field == UserFields.name) {
      userNotifier.value = user.copy(name: value);
      fieldErrorsMapNotifier.value[field] = user.name.isEmpty;
    }
    if (field == UserFields.email) {
      userNotifier.value = user.copy(email: value);
      fieldErrorsMapNotifier.value[field] = user.email.isEmpty;
    }
    if (field == UserFields.phoneNumber) {
      userNotifier.value = user.copy(phoneNumber: value);
      fieldErrorsMapNotifier.value[field] = user.phoneNumber.isEmpty;
    }
    if (field == UserFields.password) {
      userNotifier.value = user.copy(password: value);
      fieldErrorsMapNotifier.value[field] = user.password.isEmpty;
    }
    fieldErrorsMapNotifier.notifyListeners();
  }

  @override
  void dispose() {
    buttonClickedNotifier.dispose();
    fieldErrorsMapNotifier.dispose();
    userNotifier.dispose();
    stateNotifier.dispose();
  }
}