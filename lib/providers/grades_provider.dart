import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:school_helper/functions/functions.dart';

class GradesProvider with ChangeNotifier {
  List grades;

  GradesProvider({required this.grades});

  void addGrade(String subject, String date, int made, int need) {
    grades.add({'date': date, 'subject': subject, 'made': made, 'need': need});
    grades = getDataWithMonths(grades);
    Box box = Hive.box('grades');
    box.put('grades', grades);
    notifyListeners();
  }

  void changeGrade(String subject, String date, int made, int need, int index) {
    grades[index] = {
      'date': date,
      'subject': subject,
      'made': made,
      'need': need,
    };
    grades = getDataWithMonths(grades);
    Box box = Hive.box('grades');
    box.put('grades', grades);
    notifyListeners();
  }

  void deleteGrade(int index) {
    grades.removeAt(index);
    grades = getDataWithMonths(grades);
    Box box = Hive.box('grades');
    box.put('grades', grades);
    notifyListeners();
  }

  void clearAllGrades() {
    grades.clear();
    Box box = Hive.box('grades');
    box.put('grades', grades);
    notifyListeners();
  }
}
