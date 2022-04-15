import 'package:flutter/material.dart';

import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_commons_design_system/micro_commons_design_system.dart';
import 'package:micro_core/base_app.dart';
import 'package:micro_core/micro_core_utils.dart';
import 'package:micro_core/micro_app.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorOverlay(details: details);
  };
  runApp(Podfy());
}

class Podfy extends StatelessWidget with BaseApp {

  Podfy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.registerRoutes();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
    MicroAppLoginResolver()
  ];
}