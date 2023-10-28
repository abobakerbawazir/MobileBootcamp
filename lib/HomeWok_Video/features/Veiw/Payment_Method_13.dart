import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/My_textformfield_CteateAnAccount.dart';
import 'package:video/HomeWok_Video/core/components/Payment_Method_13_Componts.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';

class Payment_Method_13 extends StatefulWidget {
  const Payment_Method_13({super.key});

  @override
  State<Payment_Method_13> createState() => _Payment_Method_13State();
}

class _Payment_Method_13State extends State<Payment_Method_13> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PAYMENT MOTHED",
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "CHOOSE YOUR PAYMENT METHOD",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            My_Textformfield_CreateanAccount(
              labeltext: "Time duration",
              obscureText: false,
              suffixIcon: Text("15 days"),
            ),
            My_Textformfield_CreateanAccount(
              labeltext: "Video quialt",
              obscureText: false,
              suffixIcon: Text("Best"),
            ),
            My_Textformfield_CreateanAccount(
              labeltext: "Devices",
              obscureText: false,
              suffixIcon: Text("03"),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Cannot at any time"), Text("Yes")],
            ),
            SizedBox(
              height: 20,
            ),
            Payment_Method_13_Componts(),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Elevated_button_sign_in(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                backgroundColor: Color.fromARGB(255, 79, 76, 76),
                foregroundColor: Colors.yellow,
                onPressed: () {
                  Navigator.pushNamed(context, '/paymentMethod14');
                },
                text: "CONTINUE \$89",
                height: 60,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
