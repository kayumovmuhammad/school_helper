import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:school_helper/providers/grades_provider.dart';

double intToDouble(var number) {
  return double.parse(number.toString());
}

bool isCorrectDate(String date) {
  if (date.length != 10) {
    return false;
  }

  List<int> intIndexes = [0, 1, 3, 4, 6, 7, 8, 9];
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  for (var index in intIndexes) {
    bool ok = false;

    for (var number in numbers) {
      if (number == date[index]) {
        ok = true;
      }
    }

    if (ok == false) {
      return false;
    }
  }
  if (date[2] != '.' || date[5] != '.') {
    return false;
  }

  return true;
}

double getProcent(var made, var need) {
  double answer = 0;
  if (need != 0) {
    answer = intToDouble(made) / intToDouble(need) * 100;
  }
  if (answer > 100.0) {
    answer = 100.0;
  }
  return answer;
}

List getDaysCount(String date) {
  String sday = date[0] + date[1];
  String smonth = date[3] + date[4];
  String syear = date[6] + date[7] + date[8] + date[9];

  int day = int.parse(sday);
  int month = int.parse(smonth);
  int year = int.parse(syear);

  return [day, month, year];
}

double rountTo(double val, int to) {
  num ans = pow(10, to) * val;
  ans = ans.round();
  ans /= pow(10, to);
  return ans.toDouble();
}

double getNorm(BuildContext context) {
  double sum = 0.0;
  int count = 0;

  List todayDetaData = getDaysCount(getDate());
  int todaysCount =
      todayDetaData[0] + todayDetaData[1] * 30 + todayDetaData[2] * 365;

  var gradesProvider = Provider.of<GradesProvider>(context);

  for (var item in gradesProvider.grades) {
    if (item['type'] == 'month') {
      continue;
    }
    List detaData = getDaysCount(item['date']);
    int daysCount = detaData[0] + detaData[1] * 30 + detaData[2] * 365;
    if (todaysCount - daysCount >= 0 && todaysCount - daysCount <= 7) {
      count++;
      sum += getProcent(item['made'], item['need']);
    }
  }
  double answer = 0;
  if (count > 0) {
    answer = sum / intToDouble(count);
  }
  return rountTo(answer, 3);
}

double getNormAllTheTiem(BuildContext context) {
  double sum = 0.0;
  int count = 0;

  var gradesProvider = Provider.of<GradesProvider>(context);

  for (var item in gradesProvider.grades) {
    if (item['type'] == 'month') {
      continue;
    }
    count++;
    sum += getProcent(item['made'], item['need']);
  }
  double answer = 0;
  if (count > 0) {
    answer = sum / intToDouble(count);
  }
  return rountTo(answer, 3);
}

String getDate() {
  DateTime today = DateTime.now();
  String formatedDate = DateFormat('dd.MM.yyyy').format(today);
  return formatedDate;
}

String getReversedDate(String date) {
  String reversedDate = '';

  reversedDate +=
      date[6] +
      date[7] +
      date[8] +
      date[9] +
      date[3] +
      date[4] +
      date[0] +
      date[1];

  return reversedDate;
}

String getYearMonth(String date) {
  String reversedDate = '';

  reversedDate += date[6] + date[7] + date[8] + date[9] + date[3] + date[4];

  return reversedDate;
}

List getDataWithMonths(List list) {
  Map monthData = {};
  Set months = {};

  for (var item in list) {
    if (item['type'] == 'month') {
      continue;
    }
    String yearMonth = getYearMonth(item['date']);
    if (monthData[yearMonth] == null) {
      monthData[yearMonth] = [];
    }
    monthData[yearMonth]?.add(item);
    months.add(yearMonth);
  }

  List ans = [];

  Map formatedMonth = {
    '01': 'Январь',
    '02': 'Февраль',
    '03': 'Март',
    '04': 'Апрель',
    '05': 'Май',
    '06': 'Июнь',
    '07': 'Июль',
    '08': 'Август',
    '09': 'Сентябрь',
    '10': 'Окрябрь',
    '11': 'Ноябрь',
    '12': 'Декабрь',
  };

  List monthsList = months.toList();
  monthsList.sort((a, b) => b.compareTo(a));
  months = monthsList.toSet();

  for (var item in months) {
    ans.add({
      'type': 'month',
      'data':
          '${formatedMonth[item[4] + item[5]]}, ${item[0] + item[1] + item[2] + item[3]} год',
    });
    for (var item2 in monthData[item]!) {
      ans.add(item2);
    }
  }

  return ans;
}
