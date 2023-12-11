// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
import 'package:taskmanagerprovider/Entites/Task.dart';
import 'package:taskmanagerprovider/Entites/User.dart';


@Entity(tableName: 'TaskUser', primaryKeys: [
  'UserId',
  'TaskId'
], foreignKeys: [
  ForeignKey(
      childColumns: ['UserId'], parentColumns: ['id'], entity: User),
  ForeignKey(childColumns: ['TaskId'], parentColumns: ['id'], entity: Task)
])
class TaskUser {

  final int? UserId;
  final int? TaskId;
  TaskUser({
    this.UserId,
    this.TaskId,
  });
}
