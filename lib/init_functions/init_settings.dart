import 'package:hive_flutter/hive_flutter.dart';

Future<Map<String, dynamic>> initSettings() async {
  await Hive.openBox('settings');

  Map<String, dynamic> settings = {};

  Box box = Hive.box('settings');

  settings['isDark'] = box.get('isDark');
  if (settings['isDark'] == null) {
    settings['isDark'] = false;
  }
  settings['defaultSubject'] = box.get('defaultSubject');
  if (settings['defaultSubject'] == null) {
    settings['defaultSubject'] = 'Информатика';
  }

  return settings;
}
