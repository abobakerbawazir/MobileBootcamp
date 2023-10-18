import 'package:exercise_day_36/theme/appTeme.dart';
import 'package:exercise_day_36/theme/application_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CorurseModel.dart';
import 'CouresController.dart';
import 'CourseMangement.dart';
import 'CoursePage.dart';
//defiend Object global of project

CouresController couresController = CouresController();

void main() {
  runApp(const MyApp());
}
Application_theme appTheme = Application_theme();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    appTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: light,
      darkTheme: dark,
      themeMode: appTheme.mode,
      home: CourseMangement(),
    );
  }
}



