import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/providers/settings_provider.dart';
import 'package:school_helper/widgets/settings_widgets/clear_history.dart';
import 'package:school_helper/widgets/settings_widgets/set_default_subject.dart';
import 'package:school_helper/widgets/settings_widgets/set_theme.dart';

class Settings extends StatefulWidget {
  final BuildContext context;
  const Settings({super.key, required this.context});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String inputDefaultSubject = '';

  @override
  void initState() {
    var settingsProvider = Provider.of<SettingsProvider>(widget.context);

    inputDefaultSubject = settingsProvider.settings['defaultSubject'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Настройки", style: theme.textTheme.titleMedium),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          SetTheme(),
          SetDefaultSubject(context: context),
          ClearHistory(),
        ],
      ),
    );
  }
}
