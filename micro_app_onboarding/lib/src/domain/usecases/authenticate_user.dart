import 'package:micro_commons_deps/micro_commons_deps.dart';

abstract class AuthenticateUser {
  Future<void> call(AuthenticateUserParams params);
}

class AuthenticateUserParams  extends Equatable {
  final String login;
  final String password;

  const AuthenticateUserParams({
    required this.login,
    required this.password
  });

  @override
  List<Object?> get props => [login, password];
}