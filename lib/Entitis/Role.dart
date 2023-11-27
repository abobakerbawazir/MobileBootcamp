// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
@Entity(tableName: 'roles')
class Role {
  @primaryKey
  final int? id;
  final String? name;
  Role({
    this.id,
    this.name,
  });
}
