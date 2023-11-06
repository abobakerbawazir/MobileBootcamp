import 'package:day_48_exercise/featears/Controller/ControllerDepartments.dart';
import 'package:day_48_exercise/featears/View/AddDepartmentPage.dart';
import 'package:day_48_exercise/featears/View/HomePage.dart';
import 'package:day_48_exercise/featears/View/asd.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   "/AddCoursePage":(context) => AddCoursePage(),
      //   "/CourseDetailPage":(context) => CourseDetailPage(),
      //   "/ViewPageAddCourse":(context) => ViewPageAddCourse()
      // },
      //initialRoute: "/AddCoursePage",
      
      home: HomePage(),
    );
  }
}
