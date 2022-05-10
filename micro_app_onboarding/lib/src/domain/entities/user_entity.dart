import 'package:micro_commons_deps/micro_commons_deps.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String? confirmationPassword;

  const UserEntity({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.confirmationPassword
  });

  factory UserEntity.empty() => const UserEntity(
    name: '', email: '', phoneNumber: '', password: ''
  );

  copy({
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
    String? confirmationPassword
  }) => UserEntity(
    name: name ?? this.name, 
    email: email ?? this.email, 
    phoneNumber: phoneNumber ?? this.phoneNumber, 
    password: password ?? this.password, 
  );

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