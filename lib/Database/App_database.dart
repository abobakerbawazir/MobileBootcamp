import 'dart:async';
import 'dart:typed_data';
import 'package:car_booking/DAOs/Booking_dao.dart';
import 'package:car_booking/DAOs/Cars_dao.dart';
import 'package:car_booking/DAOs/Images_dao.dart';
import 'package:car_booking/DAOs/Prand_dao.dart';
import 'package:car_booking/DAOs/Role_dao.dart';
import 'package:car_booking/DAOs/Users_dao.dart';
import 'package:car_booking/Entitis/Booking.dart';
import 'package:car_booking/Entitis/Cars.dart';
import 'package:car_booking/Entitis/Images.dart';
import 'package:car_booking/Entitis/Prand.dart';
import 'package:car_booking/Entitis/Role.dart';
import 'package:car_booking/Entitis/Users.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

part 'App_database.g.dart';

@Database(version: 1, entities: [Car, Prand, ImageCar, Booking, User, Role])
abstract class AppDatabase extends FloorDatabase {
  RoleDao get roleDoa;
  CarDao get carDao;
  UserDao get userDao;
  BookingDao get bookingDao;
  PrandDao get prandDao;
  ImageDao get imageDao;
}
