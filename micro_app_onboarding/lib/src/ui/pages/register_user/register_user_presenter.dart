import 'package:flutter/widgets.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../presentation/helpers/helpers.dart';

abstract class RegisterUserPresenter {
  late ValueNotifier<UserEntity> userNotifier;
  late ValueNotifier<bool> formValidNotifier;
  late ValueNotifier<UIState> stateNotifier;

  void validateField(UserFields field, dynamic value);
  void init();
  void dispose();
  void register();
}