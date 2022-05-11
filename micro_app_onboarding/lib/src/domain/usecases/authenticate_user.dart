abstract class AuthenticateUser {
  Future<void> call(AuthenticateUserParams params);
}

class AuthenticateUserParams {
  final String login;
  final String password;

  const AuthenticateUserParams({
    required this.login,
    required this.password
  });
}