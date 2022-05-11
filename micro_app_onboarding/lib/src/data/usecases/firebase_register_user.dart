import 'package:micro_commons_deps/micro_commons_deps.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/register_user.dart';

class FirebaseRegisterUser implements RegisterUser {
final FirebaseAuth firebaseAuth;
  
  FirebaseRegisterUser({
    required this.firebaseAuth
  });

  @override
  Future<void> call(UserEntity user) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email.trim(),
        password: user.password.trim()
      );    
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email': throw DomainErrors.invalidEmail;
        case 'weak-password': throw DomainErrors.weakPassword;
      }
    } catch (_) {
      throw DomainErrors.unexpected;
    }
  }
}