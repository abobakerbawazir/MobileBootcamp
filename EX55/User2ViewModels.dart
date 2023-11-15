import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mukalla_store/EX55/LoginPage.dart';
import 'package:mukalla_store/EX55/towPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel2 {
  String? email;
  String? password;
  checkAuthUser(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    print("ppppppppppppppppppppppp");
    SharedPreferences shared = await SharedPreferences.getInstance();

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        if (shared.getInt("token") == null) {
          return LoginPage();
        }
        return TowPage();
      },
    ));
  }

  Future<bool> login(String email, String password) async {
    print("object");

    await authUser();
    print("sdfg");

    return true;
  }

  Future<bool> authUser() async {
    Random rand = Random();
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setInt("token", rand.nextInt(20));
    return true;
  }

  Future saveUserANdEmail(String email, String username) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString("username", username);
    await shared.setString("email", email);
  }

  Future saveEmail(String email) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString("email", email);
  }

  Future saveUser(String username) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("username", username);
  }

  Future<String> getUsernameorEmailBykey(String key) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.getString(key) as String;
  }

  // Future<String> getUsernameorEmailBykey(String key) async {
  //   SharedPreferences shared = await SharedPreferences.getInstance();
  //   String x = shared.getString(key) as String;
  //   return x;
  // }

  // Future saveListEmail(String email, String username) async {
  //   SharedPreferences shared = await SharedPreferences.getInstance();
  //   shared.setStringList("username", [email]);
  // }
  // Future saveListEmaile(String email) async {
  //   SharedPreferences shared = await SharedPreferences.getInstance();
  //   shared.setStringList("email", [saveEmail(email)as String]);
  // }
  Future saveListUserName(String username, String email) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setStringList("username", [saveEmail(username) as String]);
    shared.setStringList("email", [saveEmail(email) as String]);
  }
}
