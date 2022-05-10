
import 'package:micro_app_onboarding/src/data/usecases/firebase_register_user.dart';
import 'package:micro_app_onboarding/src/presentation/value_notifier_register_user_presenter.dart';
import 'package:micro_commons_architecture/micro_commons_architecture.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';
import 'package:micro_core/micro_app.dart';
import 'package:micro_core/micro_core_utils.dart';

import './ui/pages/pages.dart';
import 'core/factories/factories.dart';

class MicroAppOnboardingResolver implements MicroApp {
  @override
  String get name => 'onboarding';



  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/$name': (context, args) => const HomePage(),
    '/$name/register': (context, args) => makeUserPage()
  };

}