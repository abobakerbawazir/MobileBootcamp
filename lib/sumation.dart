import 'package:flutter/material.dart';

import 'HotelController.dart';

class SumationPage extends StatelessWidget {
  SumationPage({Key? key}) : super(key: key);
  HotelController pController = HotelController();
  @override
  Widget build(BuildContext context) {
    pController.getAllProducts();
    return Scaffold();}
        
}
