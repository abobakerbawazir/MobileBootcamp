// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
@Entity(tableName: 'Department')
class Department {
  @primaryKey
  final int? id;
  final String? name;
  Department({
    this.id,
    this.name,
  });
}
