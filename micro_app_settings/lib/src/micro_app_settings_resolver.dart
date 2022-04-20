
import 'package:micro_core/micro_app.dart';
import 'package:micro_core/micro_core_utils.dart';

import 'ui/pages/settings/settings_page.dart';
import 'presenters/presenter.dart';
class MicroAppSettingsResolver implements MicroApp {
  @override
  String get name => 'settings';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/$name': (context, args) => const SettingsPage(
      presenter: ValueNotifierSettingsPresenter()
    )
  };

}