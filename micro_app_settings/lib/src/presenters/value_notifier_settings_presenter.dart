import 'package:url_launcher/url_launcher.dart';

import '../ui/pages/settings/settings.dart';

class ValueNotifierSettingsPresenter implements SettingsPresenter {
  const ValueNotifierSettingsPresenter();
  
  @override
  Future<void> launchUrl(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}