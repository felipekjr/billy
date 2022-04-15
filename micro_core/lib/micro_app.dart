import 'micro_core_utils.dart';

abstract class MicroApp {
  String get name;
  Map<String, WidgetBuilderArgs> get routes;
}