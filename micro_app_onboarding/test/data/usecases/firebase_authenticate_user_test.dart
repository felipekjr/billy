import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_onboarding/src/data/usecases/usecases.dart';
import 'package:micro_app_onboarding/src/domain/helpers/helpers.dart';
import 'package:micro_app_onboarding/src/domain/usecases/usecases.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';
import 'package:micro_commons_deps/micro_commons_test_deps.dart';

import '../../mocks/mocks.dart';
import '../../mocks/user_credentials_mock.dart';
void main() {
  late FirebaseAuthenticateUser sut;
  late FirebaseAuthSpy firebaseAuthSpy;
  late AuthenticateUserParams fakeParams;

  setUp(() {
    final fakeLogin = faker.lorem.word();
    final fakePassword = faker.guid.guid();
    fakeParams = AuthenticateUserParams(login: fakeLogin, password: fakePassword);
    firebaseAuthSpy = FirebaseAuthSpy();
    sut = FirebaseAuthenticateUser(firebaseAuth: firebaseAuthSpy);

    firebaseAuthSpy.mockSignin(UserCredentialsMock());
  });
 
  test('Should return call firebaseAuth with correct values', () async {
    await sut.call(fakeParams);

    verify(() => firebaseAuthSpy.signInWithEmailAndPassword(
      email: fakeParams.login.trim(), 
      password: fakeParams.password.trim()
    ));
  });
 
  test('Should throw UnexpectedError if method fails', () async {
    firebaseAuthSpy.mockSignInError(Exception());
    expect(() => sut.call(fakeParams), throwsA(DomainErrors.unexpected));
  });

  test('Should throw InvalidCredentials if firebase not authorize', () async {
    firebaseAuthSpy.mockSignInError(FirebaseAuthException(code: faker.lorem.word()));
    expect(() => sut.call(fakeParams), throwsA(DomainErrors.invalidCredentials));
  });
}