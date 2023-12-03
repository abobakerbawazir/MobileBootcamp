import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Users.dart';
import 'package:car_booking/Views/Screens/Login.dart';
import 'package:car_booking/Views/Screens/PrandPage.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:car_booking/Views/Widgets/MyElevetedButton.dart';
import 'package:car_booking/Views/Widgets/MyTextFormField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userNmaeTxt = TextEditingController();
  TextEditingController passTxt = TextEditingController();
  TextEditingController confirmpassTxt = TextEditingController();
  TextEditingController phoneNoTxt = TextEditingController();

  bool iconObsecure = false;
  bool iconObsecure1 = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Sign in'),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: Color.fromARGB(255, 190, 188, 183),
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
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
                            color: c2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
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
                      } else if (value.length < 5) {
                        return "password can not <5 caracters";
                      } else if (value != confirmpassTxt.text) {
                        return "password is not confirm Password";
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
                  MyTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "value is Empty";
                      } else if (value.length < 5) {
                        return "password can not <5 caracters";
                      } else if (value != passTxt.text) {
                        return "password is not confirm Password";
                      }
                    },
                    obscureText: iconObsecure1,
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {});
                        if (iconObsecure1 == false) {
                          iconObsecure1 = true;
                        } else {
                          iconObsecure1 = false;
                        }
                      },
                      icon: Icon(iconObsecure1 == false
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    controller: confirmpassTxt,
                  ),
                  MyTextFormField(
                    suffixIcon: Icon(Icons.phone),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "value is Empty";
                      } else if (value.length < 9) {
                        return "User name can not <9 caracters";
                      }
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    hintText: 'Phone No',
                    controller: phoneNoTxt,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyElevatedButton(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      backgroundColor: Color.fromARGB(255, 68, 116, 183),
                      foregroundColor: Colors.white,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          User u = User(
                              roleId: 2,
                              password: passTxt.text,
                              username: userNmaeTxt.text,
                              phone: phoneNoTxt.text);
                          await DBHelper.database.userDao.addUser(u);
                          await ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "ok my friend create Succsufully Accoun, please Procees Login to route Home Page"),
                            ),
                          );
                          Navigator.pushNamed(context, '/login');
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return LoginPage();
                          //   },
                          // ));
                        }
                      },
                      text: "Create an Account"),
                  SizedBox(
                    height: 10,
                  ),
                  MyElevatedButton(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      backgroundColor: Colors.yellow,
                      foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
                      onPressed: () async {
                        Navigator.pushNamed(context, '/login');
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return LoginPage();
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
                      text: "Login")
                ],
              ),
            )),
      ),
    );
  }
}
