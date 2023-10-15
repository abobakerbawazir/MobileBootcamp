import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentMethod14 extends StatefulWidget {
  const PaymentMethod14({super.key});

  @override
  State<PaymentMethod14> createState() => _PaymentMethod14State();
}

class _PaymentMethod14State extends State<PaymentMethod14> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PAYMENT MOTHED",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 49, 48, 48),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.3,
              image: AssetImage("assets/images/5.jpg"),
              fit: BoxFit.cover),
          color: Colors.black,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Container(
              color: Color.fromARGB(255, 49, 48, 48),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 25, bottom: 10, top: 10, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Card Number",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.card_travel,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: TextField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          // fillColor: Colors.white,
                          // hoverColor: Colors.white,
                          // focusColor: Colors.white,
                          // iconColor: Colors.white,
                          // prefixIconColor: Colors.white,
                          // suffixIconColor: Colors.white,
                          contentPadding: EdgeInsets.all((3)),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Card Number",
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0))),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 25, bottom: 10, top: 10, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Expiry date",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text("CVV/CVC",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: TextField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      // fillColor: Colors.white,
                                      // hoverColor: Colors.white,
                                      // focusColor: Colors.white,
                                      // iconColor: Colors.white,
                                      // prefixIconColor: Colors.white,
                                      // suffixIconColor: Colors.white,
                                      contentPadding: EdgeInsets.all((3)),
                                      prefixIcon: Icon(Icons.search),
                                      hintText: "12  /  2021",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(0))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: TextField(
                                  maxLength: 3,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      counterText: '',
                                      // fillColor: Colors.whit
                                      // e,
                                      // hoverColor: Colors.white,
                                      // focusColor: Colors.white,
                                      // iconColor: Colors.white,
                                      // prefixIconColor: Colors.white,
                                      // suffixIconColor: Colors.white,
                                      contentPadding: EdgeInsets.all((3)),
                                      prefixIcon: Icon(Icons.search),
                                      hintText: "123",
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(0))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text("PAY NOW",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
