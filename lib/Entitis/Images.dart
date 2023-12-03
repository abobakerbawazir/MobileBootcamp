// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_booking/Entitis/Cars.dart';
import 'package:floor/floor.dart';
import 'dart:typed_data';

@Entity(tableName: 'images', foreignKeys: [
  ForeignKey(childColumns: ['car_id'], parentColumns: ['id'], entity: Car)
])
class ImageCar {
  @primaryKey
  final int? id;
  final Uint8List? name;
  @ColumnInfo(name: 'car_id')
  final int? carId;
  @ignore
  final String? nameCar;

  ImageCar({
    this.id,
    this.name,
    this.carId,this.nameCar
  });
}
