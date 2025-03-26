import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/init_functions/init_grades.dart';
import 'package:school_helper/init_functions/init_settings.dart';
import 'package:school_helper/my_app.dart';
import 'package:school_helper/providers/grades_provider.dart';
import 'package:school_helper/providers/settings_provider.dart';
import 'package:school_helper/js/remove_preloader.dart'
    if (dart.library.io) 'package:school_helper/js/remove_preloader_other.dart';

Future<void> main() async {
  removePreloader();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Map<String, dynamic> settings = await initSettings();
  var grades = await initGrades();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(settings: settings), 
        ),
        ChangeNotifierProvider<GradesProvider>(
          create: (context) => GradesProvider(grades: grades),
        ),
      ],
      child: MyApp(),
    ),
  );
}
