import 'package:day27/HotelController.dart';
import 'package:day27/HotelModel.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'main.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'pageNotFountd.dart';

class Routemanager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/page1":
        {
          HotelModel product = settings.arguments as HotelModel;
          return MaterialPageRoute(builder: (ctx) {
            return Page1(hotelModel: product,);
          });
        }
      case "/page2":
        {
          return MaterialPageRoute(builder: (ctx) {
            return Page2();
          });
        }
      case "/page3":
        {
          return MaterialPageRoute(builder: (ctx) {
            return Page3();
          });
        }
      case "/home":
        {
          return MaterialPageRoute(builder: (ctx) {
            return HomeScreen();
          });
        }
      default:
        {
          return MaterialPageRoute(builder: (ctx) {
            return PageNotFound();
          });
        }
    }
  }
}
