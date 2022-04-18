
import 'package:micro_core/micro_app.dart';
import 'package:micro_core/micro_core_utils.dart';

import 'ui/pages/pages.dart';

class MicroAppBillsResolver implements MicroApp {
  @override
  String get name => 'bills';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/$name': (context, args) => const HomePage(),
    '/$name/status': (context, args) => const StatusPage()
  };

}