import 'package:car_booking/Views/Widgets/ackgroundImage.dart';
import 'package:flutter/material.dart';

class carsScreen extends StatefulWidget {
  const carsScreen({super.key});

  @override
  State<carsScreen> createState() => _carsScreenState();
}

class _carsScreenState extends State<carsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (appBar: AppBar(),body: Container(child: Column(children: [BackgroundImage(image: "assets/5.JPG")],)),);
  }
}