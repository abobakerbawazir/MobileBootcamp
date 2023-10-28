import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/My_textformfield_CteateAnAccount.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';

//Page11
class Subscription_Plan extends StatefulWidget {
  const Subscription_Plan({super.key});

  @override
  State<Subscription_Plan> createState() => _Subscription_PlanState();
}

class _Subscription_PlanState extends State<Subscription_Plan> {
  Color backgroundColor = Color.fromARGB(255, 107, 104, 104);
  Color foregroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SUBSCRIPTION PLAN"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "CHOOSE THE PLAN THAT IS\nRIGHT FOR YOU",
                        style: TextStyle(fontSize: 11),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Downgrade or upgrade at any time",
                        style: TextStyle(fontSize: 9),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 50, left: 50),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                            "/costom_Plan_Page");
                          },
                          child: Text("Custom your Plan")))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Elevated_button_sign_in(
                      left: 5,
                      right: 5,
                      width: 120,
                      height: 60,
                      backgroundColor: backgroundColor,
                      foregroundColor: foregroundColor,
                      onPressed: () {},
                      text: "BASIC"),
                  Elevated_button_sign_in(
                      left: 5,
                      right: 5,
                      height: 60,
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      onPressed: () {},
                      text: "STANDARD"),
                  Elevated_button_sign_in(
                      left: 5,
                      right: 5,
                      height: 60,
                      backgroundColor: backgroundColor,
                      foregroundColor: foregroundColor,
                      onPressed: () {},
                      text: "PREMIMM"),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            My_Textformfield_CreateanAccount(
              labeltext: "Morthly Pric",
              obscureText: false,
              suffixIcon: Text("USD 256.99"),
            ),
            My_Textformfield_CreateanAccount(
              labeltext: "Muiltiple Devices",
              obscureText: false,
              suffixIcon: Text("Yes"),
            ),
            My_Textformfield_CreateanAccount(
              labeltext: "Video Qulity",
              obscureText: false,
              suffixIcon: Text("Beller"),
            ),
            My_Textformfield_CreateanAccount(
              labeltext: "Resolution",
              obscureText: false,
              suffixIcon: Text("1080p"),
            ),
            My_Textformfield_CreateanAccount(
              labeltext: "Screens you can watch on at\nthe same time",
              obscureText: false,
              suffixIcon: Text("04"),
            ),
            SizedBox(
              height: 30,
            ),
            Elevated_button_sign_in(
                left: 5,
                right: 5,
                height: 70,
                width: MediaQuery.of(context).size.width / 1.2,
                backgroundColor: Color.fromARGB(255, 107, 104, 104),
                foregroundColor: Color.fromARGB(255, 255, 230, 0),
                onPressed: () {Navigator.pushNamed(
                              context,
                            "/payment_Method_13");},
                text: "CONTINUE"),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5, right: 75),
              child: Column(
                children: [
                  Text(
                    "By signing up you agree to our Privacy",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, right: 182),
              child: Column(
                children: [
                  Text(
                    "Policy and Terms",
                    style: TextStyle(color: Colors.yellow),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
