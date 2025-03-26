import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/providers/grades_provider.dart';
import 'package:school_helper/widgets/home_widgets/change_grade.dart';
import 'package:school_helper/widgets/home_widgets/pie_chart_all.dart';
import 'package:school_helper/widgets/home_widgets/pie_chart_week.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String inputSubject = '', inputDate = '';
  int inputMade = 0, inputNeed = 0;

  @override
  Widget build(BuildContext context) {
    var gradesProvider = Provider.of<GradesProvider>(context);
    final theme = Theme.of(context);
    int count = min(10, gradesProvider.grades.length + 1);
    // print(grades.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Главная", style: theme.textTheme.titleMedium),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (context, indexMain) {
          int index = indexMain - 1;
          if (indexMain == 0) {
            return Row(children: [PieChartWeek(), PieChartAll()]);
          } else if (gradesProvider.grades[index]['type'] == 'month') {
            if (indexMain == count - 1) {
              return SizedBox(height: 0);
            } else {
              return Text(
                gradesProvider.grades[index]['data'],
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.center,
              );
            }
          } else {
            return Card(
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SetGrade(
                        index: index,
                        inputSubject: gradesProvider.grades[index]['subject'],
                        inputDate: gradesProvider.grades[index]['date'],
                        inputMade: gradesProvider.grades[index]['made'],
                        inputNeed: gradesProvider.grades[index]['need'],
                      );
                    },
                    isScrollControlled: true,
                  );
                },
                title: Text(
                  gradesProvider.grades[index]['subject'].toString(),
                  style: theme.textTheme.labelMedium,
                ),
                subtitle: Text(
                  gradesProvider.grades[index]['date'].toString(),
                  style: theme.textTheme.labelSmall,
                ),
                trailing: Text(
                  '${gradesProvider.grades[index]['made']}/${gradesProvider.grades[index]['need']}',
                  style: theme.textTheme.labelMedium,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
