import 'package:flutter/material.dart';
import 'package:mukalla_store/EX55/LoginPage.dart';
import 'package:mukalla_store/EX55/towPage.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    checkAuth(context);
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

checkAuth(BuildContext context) async {
  //await Future.delayed(Duration(seconds: 3));
  print("ppppppppppppppppppppppp");
  SharedPreferences shared = await SharedPreferences.getInstance();

  Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context) {
      if (shared.getInt("token") == null) {
        print("tokin is not exists");
        return LoginPage();
      }
      print("tokin is exists");
      return TowPage();
      
    },
  ));
}
