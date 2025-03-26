import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/providers/grades_provider.dart';

class ClearHistory extends StatefulWidget {
  const ClearHistory({super.key});

  @override
  State<ClearHistory> createState() => _ClearHistoryState();
}

class _ClearHistoryState extends State<ClearHistory> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradesProvider = Provider.of<GradesProvider>(context);
    return Card(
      child: ListTile(
        title: Text("Очистить всю историю", style: theme.textTheme.labelMedium),
        trailing: Icon(Icons.navigate_next, color: theme.iconTheme.color),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Вы уверены что хотите удалить историю навсегда?",
                  style: theme.textTheme.labelMedium,
                ),
                actions: [
                  CupertinoButton(
                    child: Text("OK", style: theme.textTheme.labelSmall),
                    onPressed: () {
                      gradesProvider.clearAllGrades();
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text("Отмена", style: theme.textTheme.labelSmall),
                    onPressed: () {
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
