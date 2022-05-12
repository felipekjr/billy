import 'package:micro_app_onboarding/src/domain/helpers/helpers.dart';
import 'package:micro_app_onboarding/src/domain/usecases/usecases.dart';
import 'package:micro_app_onboarding/src/presentation/helpers/user_fields.dart';
import 'package:micro_app_onboarding/src/presentation/helpers/ui_state.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:micro_app_onboarding/src/ui/pages/pages.dart';

class ValueNotifierLoginPresenter implements LoginPresenter {
  final AuthenticateUser authenticateUser;

  ValueNotifierLoginPresenter({
    required this.authenticateUser
  });
  
  @override
  late ValueNotifier<UIState> stateNotifier;

  @override
  late ValueNotifier<String> emailNotifier;

  @override
  late ValueNotifier<String> passwordNotifier;

  @override
  late ValueNotifier<bool> emailErrorNotifier;

  @override
  late ValueNotifier<bool> passwordErrorNotifier;

  @override
  late ValueNotifier<bool> buttonClickedNotifier;

  @override
  void init() {
    stateNotifier = ValueNotifier(const UIInitialState());
    emailNotifier = ValueNotifier('');
    passwordNotifier = ValueNotifier('');
    emailErrorNotifier = ValueNotifier(true);
    passwordErrorNotifier = ValueNotifier(true);
    buttonClickedNotifier = ValueNotifier(false);
  }

  @override
  Future<void> authenticate() async {
    try {
      buttonClickedNotifier.value = true;
      if (!(passwordErrorNotifier.value && emailErrorNotifier.value)) {
        stateNotifier.value = const UILoadingState();
        await authenticateUser(AuthenticateUserParams(
          login: emailNotifier.value, 
          password: passwordNotifier.value
        ));
        stateNotifier.value = const UISuccessState('');
      }
    } catch (e){
      if (e == DomainErrors.invalidCredentials) {
        stateNotifier.value = const UIErrorState('Verifique seu e-mail e senha');
      } else {
        stateNotifier.value = const UIErrorState('Não foi possível realizar o login');
      }
    }
  }

  @override
  void setEmail(String email) {
    emailNotifier.value = email;
    emailErrorNotifier.value = email.isEmpty;
  }

  @override
  void setPassword(String password) {
    passwordNotifier.value = password;
    passwordErrorNotifier.value = password.isEmpty;
  }

  @override
  void dispose() {
    stateNotifier.dispose();
    passwordNotifier.dispose();
    passwordErrorNotifier.dispose();
    emailNotifier.dispose();
    emailErrorNotifier.dispose();
    buttonClickedNotifier.dispose();
  }
}