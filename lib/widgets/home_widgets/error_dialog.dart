import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Text("Ошибка"),
      content: Text("Введите корректную дату!", style: theme.textTheme.labelMedium,),
      actions: [
        CupertinoButton(
          child: Text('OK', style: theme.textTheme.labelSmall,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}