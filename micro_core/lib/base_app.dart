import 'package:flutter/material.dart';
import 'micro_app.dart';

import 'micro_core_utils.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;
  Map<String, WidgetBuilderArgs> get baseRoutes;
  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRoutes() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final routeArgs = settings.arguments;

    final navigateTo = routes[routeName];
    if (navigateTo == null) return null;
    
    return MaterialPageRoute(
      builder: (context) => navigateTo(context, routeArgs)
    );
  }
}