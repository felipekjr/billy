import 'package:micro_commons_deps/micro_commons_deps.dart';
import 'package:micro_commons_deps/micro_commons_test_deps.dart';

class FirebaseAuthSpy extends Mock implements FirebaseAuth {
  When mockCall() => when(() => createUserWithEmailAndPassword(
      email: any(named: 'email'), 
      password: any(named: 'password')
  ));

  void mockcreateUserWithEmailAndPassword(UserCredential value) {
    mockCall().thenAnswer((_) => Future.value(value));
  }

  void mockError(Exception ex) {
    mockCall().thenThrow(ex);
  }
}