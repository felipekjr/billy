import 'package:micro_app_onboarding/src/domain/entities/user_entity.dart';

abstract class RegisterUser {
  Future<void> call(UserEntity user);
}