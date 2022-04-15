
import 'package:micro_core/micro_app.dart';
import 'package:micro_core/micro_core_utils.dart';

import 'ui/login_page.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  String get name => 'micro-app-login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/': (context, args) => const LoginPage()
  };

}