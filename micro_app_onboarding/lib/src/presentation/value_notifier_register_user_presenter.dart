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
  late ValueNotifier<bool> formValidNotifier;

  @override
  late ValueNotifier<UIState> stateNotifier;

  @override
  late ValueNotifier<UserEntity> userNotifier;

  UserEntity get user => userNotifier.value;

  @override
  void init() {
    formValidNotifier = ValueNotifier(false);
    stateNotifier = ValueNotifier(const UIInitialState());
    userNotifier = ValueNotifier(UserEntity.empty());
  }
  
  @override
  void register() async {
    try {
      await registerUser(userNotifier.value);
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
    }
    if (field == UserFields.email) {
      userNotifier.value = user.copy(email: value);
    }
    if (field == UserFields.phoneNumber) {
      userNotifier.value = user.copy(phoneNumber: value);
    }
    if (field == UserFields.password) {
      userNotifier.value = user.copy(password: value);
    }

    formValidNotifier.value = user.name.isNotEmpty && 
      user.email.isNotEmpty && 
      user.phoneNumber.isNotEmpty &&
      user.password.isNotEmpty;
  }

  @override
  void dispose() {
    formValidNotifier.dispose();
    userNotifier.dispose();
    stateNotifier.dispose();
  }
}