import 'package:car_booking/Entitis/Images.dart';
import 'package:floor/floor.dart';
@dao
abstract class ImageDao {
  @Query('SELECT * FROM images')
  Future<List<Image>> getAllImages();
  @Query('SELECT * FROM images WHERE car_id=:id')
  Future<Image?> getOneImage(int id);
  @insert
  Future<int> addImage(Image d);
  @insert
  Future<List<int>> addListImage(List<Image> d);
  @update
  Future<int> updatesImage(Image d);
  @update
  Future<int> updatesImageList(List<Image> d);
  @Query('DELETE FROM images WHERE id = :id')
  Future<int?> deleteImage(int id);
  @delete
  Future<int?> deleteImageOfObject(Image d);
  // Future<int> deleteImageList(List<Image> s);
  @Query('DELETE FROM images')
  Future<int?> deletAlleImage();
  @Query('SELECT * FROM images WHERE name LIKE :word')
  Future<List<Image>> searchByName(String word);
}
