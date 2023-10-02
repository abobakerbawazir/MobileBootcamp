import 'personBuilder.dart';

class Person {
  late String firstName, lastName;
  int? age;
  String? profession;
  List<String> hobbies = [];

  Person(PersonBuilder builder) {
    this.firstName = builder.firstName;
    this.lastName = builder.lastName;
    this.profession = builder.profession;
    this.age = builder.age;
    this.hobbies = builder.hobbies;
  }
}