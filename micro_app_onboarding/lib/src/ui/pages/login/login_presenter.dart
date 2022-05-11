import 'package:flutter/widgets.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../presentation/helpers/helpers.dart';

abstract class LoginPresenter {
  late ValueNotifier<UIState> stateNotifier;
  late ValueNotifier<String> emailNotifier;
  late ValueNotifier<String> passwordNotifier;
  late ValueNotifier<bool> emailErrorNotifier;
  late ValueNotifier<bool> passwordErrorNotifier;
  late ValueNotifier<bool> buttonClickedNotifier;

  void authenticate();
  void setEmail(String email);
  void setPassword(String password);
  void init();
  void dispose();
}