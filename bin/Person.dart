import 'dart:math';

import 'pharmacist.dart';

abstract class Person {
  late int id;
  late String name;
  late int mobile;

  Person.person({required this.name, required this.mobile}) {
    Random r = Random();
    this.id = r.nextInt(1000) + 1;
    this.name = name;
    this.mobile = mobile;
  }
  displayinformation();
}
