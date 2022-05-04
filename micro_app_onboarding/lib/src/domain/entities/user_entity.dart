import 'package:micro_commons_deps/micro_commons_deps.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmationPassword;

  const UserEntity({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmationPassword
  });

  Map toJson() => {
    'name': name,
    'email': email,
    'phoneNumber': phoneNumber,
  };

  @override
  List<Object?> get props => [
    name, email, phoneNumber, password, confirmationPassword
  ];
  
}