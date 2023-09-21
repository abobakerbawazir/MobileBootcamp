import 'Person.dart';
import 'dart:io';

class pharmacist extends Person {
  late double salary;
  pharmacist.person(
      {required super.name, required super.mobile, required this.salary})
      : super.person();

  @override
  displayinformation() {
    print(id);
    print(name);
    print(mobile);
    print(salary);
  }
  displaypharmacist(List<pharmacist> m) {
    m.forEach((element) {
      print(element.id);
      print(element.name);
      print(element.mobile);
      print(element.salary);
      
      
    });
  }

  // print(id);
  // print(name);
  // print(mobile);
  // print(salary);
}
