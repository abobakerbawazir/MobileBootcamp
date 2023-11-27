// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
@Entity(tableName: 'Prand')
class Prand {
  @primaryKey
  final int? id;
  final String? name;
  Prand({
    this.id,
    this.name,
  });
}
