// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
import 'package:flutter_application_2/day_floor/Entites/department.dart';
/* ForeignKey(
      childColumns: ['departmentId'], parentColumns: ['id'], entity: Department)
])
 ForeignKey(
      childColumns: ['ctategoryId'], parentColumns: ['id'], entity: Ctategory)
])هذا لجدول واحد فقط اما اذا كان أكثر من جول بتسوي واحد جديد مثل  */


@Entity(tableName: 'StudentX', foreignKeys: [
  ForeignKey(
      childColumns: ['departmentId'], parentColumns: ['id'], entity: Department)
], indices: [
  Index(value: ['phone_no', 'email'], unique: false)
])

class Student {
  @primaryKey
  final int? id;
  @ColumnInfo(name: 'full_name')
  final String? name;
  @ColumnInfo(name: 'phone_no')
  final String? phoneNo;
  final String? email;
  final bool? active;
  final int? departmentId;
  @ignore
  final bool isSelected;
  Student(
      {this.id,
      this.name,
      this.phoneNo,
      this.email,
      this.active,
      this.departmentId,
      this.isSelected = false});
}
