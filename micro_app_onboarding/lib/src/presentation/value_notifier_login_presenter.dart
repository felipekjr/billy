import 'package:micro_app_onboarding/src/presentation/helpers/user_fields.dart';
import 'package:micro_app_onboarding/src/presentation/helpers/ui_state.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:micro_app_onboarding/src/ui/pages/pages.dart';

class ValueNotifierLoginPresenter implements LoginPresenter {
  @override
  late ValueNotifier<UIState> stateNotifier;

  @override
  void authenticate() {
    // TODO: implement authenticate
  }

  @override
  void dispose() {
    stateNotifier.dispose();
  }

  @override
  void init() {
    stateNotifier = ValueNotifier(UIInitialState());
  }

  @override
  void validateField(UserFields field, value) {
    // TODO: implement validateField
  }
}