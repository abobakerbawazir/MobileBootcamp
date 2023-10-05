import 'package:day27/HotelModel.dart';
import 'package:flutter/material.dart';
import 'HotelController.dart';

class Page2 extends StatelessWidget {
  Page2({
    super.key,
     this.hotelModel,this.pController
  });
  HotelController? pController;
  HotelModel? hotelModel;

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
