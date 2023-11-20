// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
@Entity(tableName: 'Course')
class Course {
  @primaryKey
  final int? id;
  final String? name;
  final int hours;
  Course({
    this.id,
    this.name,
    required this.hours,
  });
}