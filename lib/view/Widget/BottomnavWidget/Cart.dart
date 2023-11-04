import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "السلة",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff285A95),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.9,
              ),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset("assets/imagesFoots/sala.png")),SizedBox(height: 15,),
              Center(
                  child: Text("السلة فارغة",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30))),
              Center(
                child: Text(
                  "لم تقم بإضافة أي عنصر حتى الأن",
                  style: TextStyle(
                      color: Color(0xff878F9F),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
