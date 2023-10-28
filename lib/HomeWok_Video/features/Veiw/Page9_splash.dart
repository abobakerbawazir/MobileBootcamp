import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';

class Page9_Splash extends StatelessWidget {
  const Page9_Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.3,
                image: AssetImage("assets/imagesvideo/Page9.png"),
                fit: BoxFit.cover),
            color: Colors.black,
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 203, 2),
                  borderRadius: BorderRadius.circular(20)),
              height: 280,
              width: 280,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.subscriptions,
                        size: 50,
                        color: Colors.black,
                      ),
                      Icon(Icons.subscriptions_outlined,
                          size: 50, color: Colors.black),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Subscribe Now  to access",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Priumum Content",
                      style: TextStyle(color: Colors.black)),
                  SizedBox(
                    height: 40,
                  ),
                  Elevated_button_sign_in(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, "/subscription_Plan");
                      },
                      text: "SUBSCRIBE NOW")
                ],
              ),
            ),
          )),
    );
  }
}
