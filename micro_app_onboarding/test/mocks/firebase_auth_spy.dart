import 'package:micro_commons_deps/micro_commons_deps.dart';
import 'package:micro_commons_deps/micro_commons_test_deps.dart';

class FirebaseAuthSpy extends Mock implements FirebaseAuth {
  When whenRegisterCall() => when(() => createUserWithEmailAndPassword(
      email: any(named: 'email'), 
      password: any(named: 'password')
  ));

  When whenSignInCall() => when(() => signInWithEmailAndPassword(
      email: any(named: 'email'), 
      password: any(named: 'password')
  ));

  void mockRegister(UserCredential value) {
    whenRegisterCall().thenAnswer((_) => Future.value(value));
  }

  void mockRegisterError(Exception ex) {
    whenRegisterCall().thenThrow(ex);
  }

  void mockSignin(UserCredential value) {
    whenSignInCall().thenAnswer((_) => Future.value(value));
  }

  void mockSignInError(Exception ex) {
    whenSignInCall().thenThrow(ex);
  }
}