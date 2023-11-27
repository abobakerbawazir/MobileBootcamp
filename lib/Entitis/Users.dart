// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_booking/Entitis/Role.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'users', foreignKeys: [
  ForeignKey(childColumns: ['roleId'], parentColumns: ['id'], entity: Role)
], indices: [
  Index(value: ['phone_no'], unique: true)
])
class User {
  @primaryKey
  final int? id;
  final int? roleId;
  final String? username;
  final String? password;
  @ColumnInfo(name: 'phone_no')
  final String? phone;

  User({this.id, this.username, this.password, this.phone, this.roleId});
}
