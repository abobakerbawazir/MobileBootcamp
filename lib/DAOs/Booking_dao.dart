import 'package:car_booking/Entitis/Booking.dart';
import 'package:floor/floor.dart';
@dao
abstract class BookingDao {
  @Query('SELECT * FROM Booking')
  Future<List<Booking>> getAllBooking();
  @Query('SELECT * FROM Booking WHERE userId=:userId')
  Future<List<Booking>> getAllBookingOfUser(int userId);
  @Query('SELECT * FROM Booking WHERE carId=:carId')
  Future<List<Booking>> getAllBookingOfCar(int carId);
  @Query('SELECT * FROM Booking WHERE id=:id')
  Future<Booking?> getOneBooking(int id);
  @insert
  Future<int> addBooking(Booking d);
  @insert
  Future<List<int>> addListBooking(List<Booking> d);
  @update
  Future<int> updatesBooking(Booking d);
  @update
  Future<int> updatesBookingList(List<Booking> d);
  @Query('DELETE FROM Booking WHERE id = :id')
  Future<int?> deleteBooking(int id);
  @delete
  Future<int?> deleteBookingOfObject(Booking d);
  // Future<int> deleteBookingList(List<Booking> s);
  @Query('DELETE FROM Booking')
  Future<int?> deletAlleBooking();
  @Query('SELECT * FROM Booking WHERE carId LIKE :word')
  Future<List<Booking>> searchByCarId(String word);
}
