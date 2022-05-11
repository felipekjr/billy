import 'package:micro_commons_deps/micro_commons_deps.dart';

import '../../data/usecases/usecases.dart';
import '../../presentation/presentation.dart';
import '../../ui/pages/pages.dart';

LoginPage makeLoginPage() => LoginPage(
  presenter: ValueNotifierLoginPresenter(
    authenticateUser: FirebaseAuthenticateUser(firebaseAuth: FirebaseAuth.instance)
  )
);