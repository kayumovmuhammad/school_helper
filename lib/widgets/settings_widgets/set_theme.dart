import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/providers/settings_provider.dart';
import 'package:school_helper/themes/light_theme.dart';

class SetTheme extends StatelessWidget {
  const SetTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Card(
      child: ListTile(
        leading: Text("Темная тема", style: theme.textTheme.labelMedium),
        trailing: CupertinoSwitch(
          value: settingsProvider.settings['isDark'],
          onChanged: (value) => settingsProvider.changeTheme(),
          activeTrackColor: theme.secondaryColor,
        ),
        onTap: () => settingsProvider.changeTheme(),
      ),
    );
  }
}