import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/Facebook_google_twwetter.dart';
import 'package:video/HomeWok_Video/core/components/My_textformfield_CteateAnAccount.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';
import 'package:video/HomeWok_Video/core/components/Costom_Plan_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool iconObsecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN IN YOUR ACCOUNT"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            My_Textformfield_CreateanAccount(
                labeltext: "Email", obscureText: false),
            My_Textformfield_CreateanAccount(
              labeltext: 'Password',
              obscureText: iconObsecure,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/verificationCodePage");
                    },
                    child: Text(
                      "Forgot your Password?",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Elevated_button_sign_in(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                height: 70,
                width: MediaQuery.of(context).size.width,
                backgroundColor: Color.fromARGB(255, 222, 201, 9),
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                text: "SIGN IN"),
            SizedBox(
              height: 60,
            ),
            Google_Facebook_Towetter(
              height: 60,
              text1: "Sign in With Social media",
              text2: "Not a member ? ",
              typesign: "Sign Up",
              onPressed: () {
                Navigator.pushNamed(context, "/createAnAccount");
              },
            ),
          ],
        ),
      )),
    );
  }
}
