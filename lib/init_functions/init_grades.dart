import 'package:hive_flutter/hive_flutter.dart';

Future<List> initGrades() async {
  await Hive.openBox('grades');
  Box box = Hive.box('grades');

  List grades = [];

  if (box.get('grades') == null) {
    box.put('grades', []);
  } else {
    grades = box.get('grades');
  }

  return grades;
}