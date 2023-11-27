// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_booking/Entitis/Cars.dart';
import 'package:floor/floor.dart';
@Entity(tableName: 'images', foreignKeys: [
  ForeignKey(
      childColumns: ['car_id'], parentColumns: ['id'], entity: Car)
])

class Image {
  @primaryKey
  final int? id;
  final String? name;
  @ColumnInfo(name: 'car_id')
  final int? carId;

  Image(
      {this.id,
      this.name,
     
      this.carId,
      });
}
