import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsProvider with ChangeNotifier {
  Map<String, dynamic> settings;
  int currentPage = 0;

  SettingsProvider({required this.settings});

  void changeTheme() {
    settings['isDark'] = !settings['isDark'];
    Box box = Hive.box('settings');
    box.put('isDark', settings['isDark']);
    notifyListeners();
  }

  void changeSubject(String value) {
    settings['defaultSubject'] = value;
    Box box = Hive.box('settings');
    box.put('defaultSubject', settings['defaultSubject']);
    notifyListeners();
  }

  void changePage(int current) {
    currentPage = current;
    notifyListeners();
  }
}
