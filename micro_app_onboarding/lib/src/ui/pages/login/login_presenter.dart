import 'package:flutter/widgets.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../presentation/helpers/helpers.dart';

abstract class LoginPresenter {
  late ValueNotifier<UIState> stateNotifier;

  void validateField(UserFields field, dynamic value);
  void init();
  void dispose();
  void authenticate();
}