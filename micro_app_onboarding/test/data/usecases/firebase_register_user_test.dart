import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_onboarding/src/data/usecases/usecases.dart';
import 'package:micro_app_onboarding/src/domain/entities/user_entity.dart';
import 'package:micro_app_onboarding/src/domain/helpers/helpers.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';
import 'package:micro_commons_deps/micro_commons_test_deps.dart';

import '../../mocks/mocks.dart';

class UserCredentialsMock extends Mock implements UserCredential {}

void main() {
  late FirebaseRegisterUser sut;
  late FirebaseAuthSpy firebaseAuthSpy;

  setUp(() {
    firebaseAuthSpy = FirebaseAuthSpy();
    sut = FirebaseRegisterUser(
      firebaseAuth: firebaseAuthSpy
    );

    firebaseAuthSpy.mockcreateUserWithEmailAndPassword(UserCredentialsMock());
  });

  UserEntity makeFakeUser() => UserEntity(
    name: faker.person.name(), 
    email: faker.lorem.word() + '@gmail.com', 
    phoneNumber: faker.phoneNumber.us(), 
    password: faker.guid.guid()
  );

  test('Should call firebaseAuth with correct values', () async {
    final fakeUser = makeFakeUser();

    await sut.call(fakeUser);

    verify(() => firebaseAuthSpy.createUserWithEmailAndPassword(
      email: fakeUser.email, 
      password: fakeUser.password
    ));
  });

  test('Should throw UnexpectedError if method fails', () async {
    firebaseAuthSpy.mockError(Exception());
    expect(() => sut.call(makeFakeUser()), throwsA(DomainErrors.unexpected));
  });

  test('Should throw InvalidEmail if firebaseAuth throws exception with invalid-email code', () async {
    firebaseAuthSpy.mockError(FirebaseAuthException(code: 'invalid-email'));
    expect(() => sut.call(makeFakeUser()), throwsA(DomainErrors.invalidEmail));
  });

  test('Should throw WeakPassword if firebaseAuth throws exception with weak-password code', () async {
    firebaseAuthSpy.mockError(FirebaseAuthException(code: 'weak-password'));
    expect(() => sut.call(makeFakeUser()), throwsA(DomainErrors.weakPassword));
  });
}