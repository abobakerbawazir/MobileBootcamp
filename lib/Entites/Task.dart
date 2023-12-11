// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';


import 'package:floor/floor.dart';
import 'package:taskmanagerprovider/Entites/User.dart';

@Entity(tableName: 'tasks', foreignKeys: [
  ForeignKey(childColumns: ['userId'], parentColumns: ['id'], entity: User)
])
class Task {
  @primaryKey
  final int? id;
  final int? userId;
  final String? title;
  final String? description;
  final bool? active;
 
  Task(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.active});
}
