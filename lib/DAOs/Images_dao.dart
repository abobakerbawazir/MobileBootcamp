import 'package:car_booking/Entitis/Images.dart';
import 'package:floor/floor.dart';
@dao
abstract class ImageDao {
  @Query('select * from images inner join cars where cars.id=images.carId group by cars.name')
  Future<List<ImageCar>> getAllImagesAndCars();
  @Query('SELECT * FROM images')
  Future<List<ImageCar>> getAllImages();
  @Query('SELECT * FROM images WHERE car_id=:carId')
  Future<List<ImageCar>> getAllImagesOfCarId(int carId);
  @Query('SELECT * FROM images WHERE car_id=:car_id ORDER BY car_id LIMIT 1')
  Future<ImageCar?> getOneImage(int car_id);
  @insert
  Future<int> addImage(ImageCar d);
  @insert
  Future<List<int>> addListImage(List<ImageCar> d);
  @update
  Future<int> updatesImage(ImageCar d);
  @update
  Future<int> updatesImageList(List<ImageCar> d);
  @Query('DELETE FROM images WHERE id = :id')
  Future<int?> deleteImage(int id);
  @delete
  Future<int?> deleteImageOfObject(ImageCar d);
  // Future<int> deleteImageList(List<Image> s);
  @Query('DELETE FROM images')
  Future<int?> deletAlleImage();
  @Query('SELECT * FROM images WHERE name LIKE :word')
  Future<List<ImageCar>> searchByName(String word);
}
