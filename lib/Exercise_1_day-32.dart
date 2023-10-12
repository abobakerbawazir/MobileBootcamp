import 'dart:math';

import 'package:flutter/material.dart';

class Exercise1DAY_32 extends StatefulWidget {
  const Exercise1DAY_32({super.key});

  @override
  State<Exercise1DAY_32> createState() => _Exercise1DAY_32State();
}

class _Exercise1DAY_32State extends State<Exercise1DAY_32> {
  Random r = Random();
  

  double width = 100;
  double heigth = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: width, end: width),
        duration: const Duration(seconds: 1),
        //value ///duration: Duration(seconds: 5), ترمز للقيمة حق value
        builder: (context, value, x) {
          return Center(
            child: Container(
              width: value,
              height: heigth,
              child: x,
            ),
          );
        },
        child: Center(
          child: Container(
            height: heigth,
            // width: value,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (width == 100) {
            // heigth = heigth;
            width = 300;
            setState(() {});
          } else if (width == 300) {
            // heigth = heigth;
            width = 100;
            setState(() {});
          }
        },
      ),
    );
  }
}
