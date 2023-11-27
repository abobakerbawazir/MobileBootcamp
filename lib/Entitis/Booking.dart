// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_booking/Entitis/Cars.dart';
import 'package:car_booking/Entitis/Users.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'Booking', primaryKeys: [
  'carId',
  'userId'
], foreignKeys: [
  ForeignKey(childColumns: ['carId'], parentColumns: ['id'], entity: Car),
  ForeignKey(childColumns: ['userId'], parentColumns: ['id'], entity: User)
])
class Booking {
  final int? carId;
  final int? userId;
  final String? from;
  final String? to;
  final int? total;
  Booking({this.carId, this.userId, this.from, this.to,this.total});
}
