import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/functions/functions.dart';
import 'package:school_helper/providers/grades_provider.dart';
import 'package:school_helper/themes/light_theme.dart';
import 'package:school_helper/widgets/home_widgets/error_dialog.dart';

class SetGrade extends StatefulWidget {
  final int index;
  final String inputSubject, inputDate;
  final int inputMade, inputNeed;
  const SetGrade({
    super.key,
    required this.index,
    required this.inputSubject,
    required this.inputDate,
    required this.inputMade,
    required this.inputNeed,
  });

  @override
  State<SetGrade> createState() => _SetGradeState();
}

class _SetGradeState extends State<SetGrade> {
  int index = 0;
  String inputSubject = '', inputDate = '';
  int inputMade = 0, inputNeed = 0;

  @override
  void initState() {
    index = widget.index;
    inputSubject = widget.inputSubject;
    inputDate = widget.inputDate;
    inputMade = widget.inputMade;
    inputNeed = widget.inputNeed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var gradesProvider = Provider.of<GradesProvider>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height - 56,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Изменить", style: theme.textTheme.titleMedium),
          actions: [
            IconButton(
              onPressed: () {
                gradesProvider.deleteGrade(index);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Отмена', style: theme.textTheme.labelSmall),
            ),
            CupertinoButton(
              onPressed: () {
                if (isCorrectDate(inputDate)) {
                  gradesProvider.changeGrade(
                    inputSubject,
                    inputDate,
                    inputMade,
                    inputNeed,
                    index,
                  );
                  Navigator.of(context).pop();
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
                    borderSide: BorderSide(
                      color: theme.secondaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.underLineInputBorderEnabledColor,
                      width: 1,
                    ),
                  ),
                ),
                initialValue: inputDate,
                style: theme.textTheme.bodyMedium,
                onChanged: (value) {
                  setState(() {
                    inputDate = value;
                  });
                },
              ),
              Text('Предмет:', style: theme.textTheme.bodyLarge),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.secondaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.underLineInputBorderEnabledColor,
                      width: 1,
                    ),
                  ),
                ),
                initialValue: inputSubject,
                style: theme.textTheme.bodyMedium,
                onChanged: (value) {
                  setState(() {
                    inputSubject = value;
                  });
                },
              ),
              Text('Сделал:', style: theme.textTheme.bodyLarge),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.secondaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.underLineInputBorderEnabledColor,
                      width: 1,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                initialValue: inputMade.toString(),
                style: theme.textTheme.bodyMedium,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  setState(() {
                    inputMade = (value != '' ? int.parse(value) : 0);
                  });
                },
              ),
              Text('Нужно было сделать:', style: theme.textTheme.bodyLarge),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.secondaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.underLineInputBorderEnabledColor,
                      width: 1,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                initialValue: inputNeed.toString(),
                style: theme.textTheme.bodyMedium,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  setState(() {
                    inputNeed = (value != '' ? int.parse(value) : 0);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
