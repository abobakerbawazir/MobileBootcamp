import 'package:car_booking/Entitis/Cars.dart';
import 'package:floor/floor.dart';
@dao
abstract class CarDao {
  @Query('SELECT * FROM cars')
  Future<List<Car>> getAllCars();
  @Query('SELECT * FROM cars WHERE id=:id')
  Future<Car?> getOneCar(int id);
  @insert
  Future<int> addCar(Car d);
  @insert
  Future<List<int>> addListCar(List<Car> d);
  @update
  Future<int> updatesCar(Car d);
  @update
  Future<int> updatesCarList(List<Car> d);
  @Query('DELETE FROM cars WHERE id = :id')
  Future<int?> deleteCar(int id);
  @delete
  Future<int?> deleteCarOfObject(Car d);
  // Future<int> deleteCarList(List<Car> s);
  @Query('DELETE FROM cars')
  Future<int?> deletAlleCar();
  @Query('SELECT * FROM cars WHERE name LIKE :word')
  Future<List<Car>> searchByName(String word);
}
