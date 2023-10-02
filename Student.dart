import 'Department.dart';
import 'Grade.dart';

class Student {
  late int id;
  late String name;
  late Department department;
  // Set<Grade> studentGrad = {};

  Student({required this.id, required this.name});

  String toString() => "Id : $id name: $name";
}
