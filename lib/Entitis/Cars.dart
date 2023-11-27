// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_booking/Entitis/Prand.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'cars',foreignKeys: [ForeignKey(childColumns: ['prandId'], parentColumns: ['id'], entity: Prand)])
class Car {
  @primaryKey
  final int? id;
  final int? prandId;
  @ColumnInfo(name: 'full_name')
  final String? name;
  final String? model;
  final bool? active;
  final int? price;
  Car({this.id, this.name, this.model, this.active, this.price,this.prandId});
}
