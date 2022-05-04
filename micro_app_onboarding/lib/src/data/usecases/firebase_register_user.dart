import 'package:micro_commons_infra/micro_commons_infra.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/register_user.dart';

class FirebaseRegisterUser implements RegisterUser {
  final FirebaseClient firebaseClient;
  
  FirebaseRegisterUser({
    required this.firebaseClient
  });

  @override
  Future<void> call(UserEntity user) async {
    firebaseClient.save(path: '', data: user.toJson());
  }
}