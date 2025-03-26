import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/providers/settings_provider.dart';

class SetDefaultSubject extends StatefulWidget {
  final BuildContext context;
  const SetDefaultSubject({super.key, required this.context});

  @override
  State<SetDefaultSubject> createState() => _SetDefaultSubjectState();
}

class _SetDefaultSubjectState extends State<SetDefaultSubject> {
  String inputDefaultSubject = '';

  @override
  void initState() {
    final settingsProvider = Provider.of<SettingsProvider>(widget.context);
    inputDefaultSubject = settingsProvider.settings['defaultSubject'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Card(
      child: ListTile(
        leading: Text(
          "Предмет по умолчанию",
          style: theme.textTheme.labelMedium,
        ),
        trailing: Icon(Icons.navigate_next, color: theme.iconTheme.color),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Предмет по умолчанию:",
                  style: theme.textTheme.labelMedium,
                ),
                content: TextFormField(
                  initialValue: inputDefaultSubject,
                  onChanged: (value) {
                    inputDefaultSubject = value;
                  },
                ),
                actions: [
                  CupertinoButton(
                    child: Text("Отмена", style: theme.textTheme.labelSmall),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text("OK", style: theme.textTheme.labelSmall),
                    onPressed: () {
                      settingsProvider.changeSubject(inputDefaultSubject);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
