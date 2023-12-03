import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Views/Screens/AddImagesOfCarByIdCar.dart';
import 'package:car_booking/Views/Screens/BookingDetealsAdmin.dart';
import 'package:car_booking/Views/Screens/BookingPageScreen.dart';
import 'package:car_booking/Views/Screens/Booking_detealsPage.dart';
import 'package:car_booking/Views/Screens/HomePageScrren.dart';
import 'package:car_booking/Views/Screens/Login.dart';
import 'package:car_booking/Views/Screens/PrandPage.dart';
import 'package:car_booking/Views/Screens/SignIn.dart';
import 'package:car_booking/Views/Screens/carIDPage.dart';
import 'package:car_booking/Views/Screens/cars.dart';
import 'package:car_booking/Views/Screens/imageScreen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:floor/floor.dart';

// import 'package:floor_generator/generator.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();

  final prefs = await SharedPreferences.getInstance();
  prefs.getString('username');
  prefs.getString('password');
  final token = prefs.getBool('token') ?? false;

  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final bool token;
  MyApp({super.key, required this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: token ? '/home' : '/',
      routes: {
        '/prand': (context) => PrandPage(),
        '/home': (context) => HomePageScreen(),
        '/car': (context) => carsScreen(),
        '/carId': (context) => CarIdPage(),
        '/booking': (context) => BookingPageScreen(),
        '/login': (context) => LoginPage(),
        '/': (context) => SignInPage(),
        '/AddImageCarpage': (context) => AddImageCarpage(),
        '/BookingDetealsPageScreen': (context) => BookingDetealsPageScreen(),
        '/BookingDetealsAdmin': (context) => BookingDetealsAdmin()
      },

      // home: const PrandPage(),
    );
  }
}
