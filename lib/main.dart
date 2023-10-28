import 'package:flutter/material.dart';
import 'package:video/HomeWok_Video/core/helpers/Route_Manger.dart';
import 'package:video/HomeWok_Video/core/components/Costom_Plan_page.dart';
import 'package:video/HomeWok_Video/features/Veiw/CreateAnAccount.dart';
import 'package:video/HomeWok_Video/features/Veiw/EditProfile.dart';
import 'package:video/HomeWok_Video/features/Veiw/HomeScreen.dart';
import 'package:video/HomeWok_Video/features/Veiw/Login_7.dart';
import 'package:video/HomeWok_Video/features/Veiw/Page9_splash.dart';
import 'package:video/HomeWok_Video/features/Veiw/Payment/Payment_15_page.dart';
import 'package:video/HomeWok_Video/features/Veiw/PaymentMethod14.dart';
import 'package:video/HomeWok_Video/features/Veiw/Payment_Method_13.dart';
import 'package:video/HomeWok_Video/features/Veiw/Sign_in.dart';
import 'package:video/HomeWok_Video/features/Veiw/Subscription_Plan.dart';
import 'package:video/HomeWok_Video/features/Veiw/VerificationCode.dart';
import 'package:video/HomeWok_Video/features/Veiw/Costom_Plan_Page.dart';
import 'package:video/HomeWok_Video/features/Veiw/bottomNavigationBar/BottomNav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNav(),
      theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.yellow))),
      // darkTheme: ThemeData(brightness: Brightness.dark,),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
