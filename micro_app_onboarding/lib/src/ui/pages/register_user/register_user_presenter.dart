import 'package:flutter/widgets.dart';
import '../../helpers/helpers.dart';
import '../../../domain/entities/user_entity.dart';

abstract class RegisterUserPresenter {
  late ValueNotifier<UserEntity?> userNotifier;
  late ValueNotifier<bool> formValidNotifier;
  late ValueNotifier<UIState> stateNotifier;

  void init();
  void register();
}