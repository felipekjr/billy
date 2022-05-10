import '../entities/user_entity.dart';

abstract class RegisterUser {
  Future<void> call(UserEntity user);
}