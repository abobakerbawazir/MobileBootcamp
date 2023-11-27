import 'package:car_booking/Entitis/Prand.dart';
import 'package:floor/floor.dart';
@dao
abstract class PrandDao {
  @Query('SELECT * FROM Prand')
  Future<List<Prand>> getAllPrands();
  @Query('SELECT * FROM Prand WHERE id=:id')
  Future<Prand?> getOnePrand(int id);
  @insert
  Future<int> addPrand(Prand d);
  @insert
  Future<List<int>> addListPrand(List<Prand> d);
  @update
  Future<int> updatesPrand(Prand d);
  @update
  Future<int> updatesPrandList(List<Prand> d);
  @Query('DELETE FROM Prand WHERE id = :id')
  Future<int?> deletePrand(int id);
  @delete
  Future<int?> deletePrandOfObject(Prand d);
  // Future<int> deletePrandList(List<Prand> s);
  @Query('DELETE FROM Prand')
  Future<int?> deletAllePrand();
  @Query('SELECT * FROM Prand WHERE name LIKE :word')
  Future<List<Prand>> searchByName(String word);
}
