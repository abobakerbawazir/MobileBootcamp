import 'package:day27/HotelModel.dart';
import 'package:flutter/material.dart';
import 'HotelController.dart';

class Page1 extends StatelessWidget {
  Page1({
    super.key,
    required this.hotelModel,this.pController
  });
  HotelController? pController;
  late HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    pController!.getAllProducts();
    return Column(
      children: [
        Container(
          child: InkWell(
            // onTap: () {
            //   Navigator.pushNamed(context, "/page2");
            // },
            child: Container(
              child: Image.asset("${pController!.products[0].thumbnail}"),
            ),
          ),
        ),
      ],
    );
  }
}
