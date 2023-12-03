import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Users.dart';
import 'package:car_booking/Views/Screens/HomePageScrren.dart';
import 'package:car_booking/Views/Screens/SignIn.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:car_booking/Views/Widgets/MyElevetedButton.dart';
import 'package:car_booking/Views/Widgets/MyTextFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  TextEditingController userNmaeTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  bool iconObsecure = false;
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Login page"),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: Color.fromARGB(255, 190, 188, 183),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "HI ,Welcome Back,You've been missed",
                      style: TextStyle(
                          color: c2, fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 40,
                ),
                MyTextFormField(
                  suffixIcon: Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is Empty";
                    } else if (value.length < 5) {
                      return "User name can not <5 caracters";
                    }
                  },
                  hintText: 'User Name',
                  controller: userNmaeTxt,
                ),
                MyTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is Empty";
                    }
                  },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "value is Empty";
                  //   }
                  // },
                  obscureText: iconObsecure,
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                      if (iconObsecure == false) {
                        iconObsecure = true;
                      } else {
                        iconObsecure = false;
                      }
                    },
                    icon: Icon(iconObsecure == false
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  controller: passTxt,
                ),
                SizedBox(
                  height: 20,
                ),
                MyElevatedButton(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    backgroundColor: Colors.yellow,
                    foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
                    onPressed: () async {
                      if (await DBHelper.database.userDao
                              .getOneUserByuserNameAndPassword(
                                  userNmaeTxt.text, passTxt.text) !=
                          null) {
                        await DBHelper.database.userDao
                            .getOneUserByuserNameAndPassword(
                                userNmaeTxt.text, passTxt.text);

                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('token', true);
                        prefs.setString('username', userNmaeTxt.text);
                        prefs.setString('password', passTxt.text);
                        // Navigator.pushReplacement(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return HomePageScreen(id: 2,);
                        //   },
                        // ));
                        Navigator.pushReplacementNamed(context, '/home',
                            arguments: [userNmaeTxt.text, passTxt.text]);
                        await ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "ok my friend create Succsufully Login, user Name = ${userNmaeTxt.text}"),
                          ),
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Center(child: Text("Cancel")))
                              ],
                              title: Text(
                                  "username and password is not correct, right agian ❤"),
                            );
                          },
                        );
                      }

                      // if (_formKey.currentState!.validate()) {
                      //   User u = User(
                      //       roleId: 2,
                      //       password: passTxt.text,
                      //       username: userNmaeTxt.text,
                      //       phone: phoneNoTxt.text);
                      //   await DBHelper.database.userDao.addUser(u);
                      //   await ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text("ok my friend"),
                      //     ),
                      //   );
                      //   Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) {
                      //       return PrandPage();
                      //     },
                      //   ));
                      // }
                    },
                    text: "Login"),
                SizedBox(
                  height: 20,
                ),
                MyElevatedButton(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    backgroundColor: Color.fromARGB(255, 68, 116, 183),
                    foregroundColor: Colors.white,
                    onPressed: () async {
                      Navigator.pushNamed(context, '/');
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) {
                      //     return SignInPage();
                      //   },
                      // ));
                      // if (_formKey.currentState!.validate()) {
                      //   User u = User(
                      //       roleId: 2,
                      //       password: passTxt.text,
                      //       username: userNmaeTxt.text,
                      //       phone: phoneNoTxt.text);
                      //   await DBHelper.database.userDao.addUser(u);
                      //   await ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text("ok my friend"),
                      //     ),
                      //   );
                      //   Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) {
                      //       return PrandPage();
                      //     },
                      //   ));
                      // }
                    },
                    text: "Create an Account")
              ],
            )),
      ),
    );
  }
}
