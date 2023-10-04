

import 'package:day_26/Exercise1.dart';
import 'package:flutter/material.dart';

import 'Exercise2.dart';
void main() {
  runApp(const MyHomePage());
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Exercise1(),);
  }
}