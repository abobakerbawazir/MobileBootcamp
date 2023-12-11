import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class User {
  @primaryKey
  final int? id;
  final String? username;
  final String? password;
  @ColumnInfo(name: 'phone_no')
  final String? phone;

  User({this.id, this.username, this.password, this.phone});
}
