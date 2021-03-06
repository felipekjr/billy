import 'package:flutter/material.dart';
import 'package:micro_app_bills/micro_app_bills.dart';
import 'package:micro_app_onboarding/micro_app_onboarding.dart';
import 'package:micro_app_settings/micro_app_settings.dart';
import 'package:micro_commons_deps/micro_commons_deps.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';
import 'package:micro_core/base_app.dart';
import 'package:micro_core/micro_core_utils.dart';
import 'package:micro_core/micro_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorOverlay(details: details);
  };
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Billy());
}

class Billy extends StatelessWidget with BaseApp {

  Billy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.registerRoutes();

    return MaterialApp(
      title: 'Billy',
      theme: CustomTheme.data,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/onboarding',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
    MicroAppOnboardingResolver(),
    MicroAppSettingsResolver(),
    MicroAppBillsResolver()
  ];
}