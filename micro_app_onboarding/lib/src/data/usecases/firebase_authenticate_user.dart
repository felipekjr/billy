import 'package:micro_app_onboarding/src/domain/helpers/helpers.dart';
import 'package:micro_app_onboarding/src/domain/usecases/usecases.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';

class FirebaseAuthenticateUser implements AuthenticateUser {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthenticateUser({required this.firebaseAuth});

  @override
  Future<void> call(AuthenticateUserParams params) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: params.login.trim(), 
        password: params.password.trim()
      );
    } on FirebaseAuthException catch (_) {
      throw DomainErrors.invalidCredentials;
    } catch (_) {
      throw DomainErrors.unexpected;
    }
  }

}