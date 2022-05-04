import 'package:flutter/widgets.dart';
import 'package:micro_app_onboarding/src/ui/helpers/ui_state.dart';
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
  late ValueNotifier<UserEntity?> userNotifier;

  @override
  void init() {
    formValidNotifier = useValueNotifier(true);
    stateNotifier = useValueNotifier(const UIInitialState());
    userNotifier = useValueNotifier(null);
  }
  
  @override
  void register() {
    try {
      registerUser(userNotifier.value!);
    } catch (_) {
      stateNotifier.value = const UIErrorState('Erro ao cadastrar usuário');
    }
  }
}