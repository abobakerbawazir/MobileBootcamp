import 'Exercise1.dart';
import 'Exercise2.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (Exerxise1()),
    );
  }
}