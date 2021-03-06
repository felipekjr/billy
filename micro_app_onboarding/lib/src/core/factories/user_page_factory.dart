import 'package:micro_commons_deps/micro_commons_deps.dart';

import '../../data/usecases/usecases.dart';
import '../../presentation/presentation.dart';
import '../../ui/pages/pages.dart';

RegisterUserPage makeUserPage() => RegisterUserPage(
  presenter: ValueNotifierRegisterUserPresenter(
    registerUser: FirebaseRegisterUser(
      firebaseAuth: FirebaseAuth.instance
    )
  )
);