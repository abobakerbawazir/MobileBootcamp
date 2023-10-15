import 'package:flutter/material.dart';
import 'package:video/HomeScrrens.dart';
import 'package:video/LListofEmpty.dart';
import 'package:video/PageNotFound.dart';
import 'package:video/PaymentMethod14.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (ctx) {
            return HomeScreens();
          });
        }
      case '/home':
        {
          return MaterialPageRoute(builder: (ctx) {
            return HomeScreens();
          });
        }
      case '/list_Empty':
        {
          return MaterialPageRoute(builder: (ctx) {
            return ListIsEmpty();
          });
        }
      case '/PaymentMethod14':
        {
          return MaterialPageRoute(builder: (ctx) {
            return PaymentMethod14();
          });
        }

      //   case '/details':{
      //     ProductModel product=settings.arguments as ProductModel;
      //     return MaterialPageRoute(builder: (ctx){
      //       return ProductDetails(product: product,);
      //     });
      // }
      default:
        {
          return MaterialPageRoute(builder: (ctx) {
            return PageNotFound();
          });
        }
    }
  }
}
