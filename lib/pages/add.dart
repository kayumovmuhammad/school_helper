import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/functions/functions.dart';
import 'package:school_helper/providers/grades_provider.dart';
import 'package:school_helper/providers/settings_provider.dart';
import 'package:school_helper/themes/light_theme.dart';
import 'package:school_helper/widgets/home_widgets/error_dialog.dart';

class Add extends StatefulWidget {
  final String inputSubject;
  const Add({super.key, required this.inputSubject});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String inputSubject = '', inputDate = getDate();
  int inputMade = 0, inputNeed = 0;

  @override
  void initState() {
    inputSubject = widget.inputSubject;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var gradesProvider = Provider.of<GradesProvider>(context);
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавить", style: theme.textTheme.titleMedium),
        actions: [
          CupertinoButton(
            onPressed: () {
              setState(() {
                inputSubject = settingsProvider.settings['defaultSubject'];
                inputDate = getDate();
                inputMade = 0;
                inputNeed = 0;
              });
            },
            child: Text('Очистить', style: theme.textTheme.labelSmall),
          ),
          CupertinoButton(
            onPressed: () {
              if (isCorrectDate(inputDate)) {
                gradesProvider.addGrade(
                  inputSubject,
                  inputDate,
                  inputMade,
                  inputNeed,
                );
                setState(() {
                  inputSubject = settingsProvider.settings['defaultSubject'];
                  inputDate = getDate();
                  inputMade = 0;
                  inputNeed = 0;
                });
                settingsProvider.changePage(0);
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ErrorDialog();
                  },
                );
              }
            },
            child: Text('OK', style: theme.textTheme.labelSmall),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Text('Дата:', style: theme.textTheme.bodyLarge),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.secondaryColor, width: 2),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.underLineInputBorderEnabledColor,
                    width: 1,
                  ),
                ),
              ),
              controller: TextEditingController(text: inputDate),
              style: theme.textTheme.bodyMedium,
              onChanged: (value) {
                inputDate = value;
              },
            ),
            Text('Предмет:', style: theme.textTheme.bodyLarge),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.secondaryColor, width: 2),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.underLineInputBorderEnabledColor,
                    width: 1,
                  ),
                ),
              ),
              controller: TextEditingController(text: inputSubject),
              style: theme.textTheme.bodyMedium,
              onChanged: (value) {
                inputSubject = value;
              },
            ),
            Text('Сделал:', style: theme.textTheme.bodyLarge),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.secondaryColor, width: 2),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.underLineInputBorderEnabledColor,
                    width: 1,
                  ),
                ),
              ),
              controller: TextEditingController(text: inputMade.toString()),
              keyboardType: TextInputType.number,
              style: theme.textTheme.bodyMedium,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                inputMade = (value != '' ? int.parse(value) : 0);
              },
            ),
            Text('Нужно было сделать:', style: theme.textTheme.bodyLarge),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.secondaryColor, width: 2),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.underLineInputBorderEnabledColor,
                    width: 1,
                  ),
                ),
              ),
              controller: TextEditingController(text: inputNeed.toString()),
              keyboardType: TextInputType.number,
              style: theme.textTheme.bodyMedium,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                inputNeed = (value != '' ? int.parse(value) : 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
