// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:car_booking/Entitis/Images.dart';
import 'package:car_booking/Entitis/Prand.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'cars', foreignKeys: [
  ForeignKey(childColumns: ['prandId'], parentColumns: ['id'], entity: Prand)
])
class Car {
  @primaryKey
  final int? id;
  final int? prandId;
  final String? name;
  final String? model;
  final bool? active;
  final int? price;
  @ignore
  final Uint8List? nameImages;
  @ignore
  final ImageCar? images;
  Car(
      {this.id,
      this.name,
      this.model,
      this.active,
      this.price,
      this.prandId,
      this.nameImages,
      this.images});
}
