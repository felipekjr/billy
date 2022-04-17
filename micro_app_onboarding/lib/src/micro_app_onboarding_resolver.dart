
import 'package:micro_core/micro_app.dart';
import 'package:micro_core/micro_core_utils.dart';

import './ui/pages/pages.dart';

class MicroAppOnboardingResolver implements MicroApp {
  @override
  String get name => 'onboarding';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/$name': (context, args) => const HomePage(),
    '/$name/register': (context, args) => const RegisterUserPage()
  };

}