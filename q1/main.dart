import 'dart:io';

import 'Person.dart';
import 'personBuilder.dart';

void main(List<String> args) {
  try {
    PersonBuilder pb = PersonBuilder(firstName: stdin.readLineSync()!, lastName: stdin.readLineSync()!)
        .setprofession(stdin.readLineSync()!)
        .setage(int.parse(stdin.readLineSync()!))
      ..build();
    Person p = Person(pb);
    print("Name ${p.firstName + " " + p.lastName}");
  } catch (e) {
    print(e);
  }
}
