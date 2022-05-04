
import 'package:micro_app_onboarding/src/data/usecases/firebase_register_user.dart';
import 'package:micro_app_onboarding/src/presentation/value_notifier_register_user_presenter.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';
import 'package:micro_commons_infra/micro_commons_infra.dart';
import 'package:micro_core/micro_app.dart';
import 'package:micro_core/micro_core_utils.dart';

import './ui/pages/pages.dart';

class MicroAppOnboardingResolver implements MicroApp {
  @override
  String get name => 'onboarding';

  RegisterUserPage makeUserPage() => RegisterUserPage(
    presenter: ValueNotifierRegisterUserPresenter(
      registerUser: FirebaseRegisterUser(
        firebaseClient: FirebaseAdapter(
          fireStoreClient: FirebaseFirestore.instance
        )
      )
    )
  );

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/$name': (context, args) => const HomePage(),
    '/$name/register': (context, args) => makeUserPage()
  };

}