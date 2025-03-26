import 'package:flutter/material.dart';
import 'package:school_helper/pages/add.dart';
import 'package:school_helper/pages/home.dart';
import 'package:school_helper/pages/settings.dart';
import 'package:school_helper/providers/settings_provider.dart';
import 'package:school_helper/themes/dark_theme.dart';
import 'package:school_helper/themes/light_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final List<Widget> screens = [
      Home(),
      Add(inputSubject: settingsProvider.settings['defaultSubject']),
      Settings(context: context),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          settingsProvider.settings['isDark'] ? darkThemeData : lightThemeData,
      home: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: settingsProvider.currentPage,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: theme.secondaryColor,
            currentIndex: settingsProvider.currentPage,
            onTap: (value) {
              setState(() {
                settingsProvider.changePage(value);
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
