

import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(onTap:() {
        Navigator.pushNamed(context, "/main");
      },
        child: Container(
          color: Colors.brown,
          height: 200,width: 200,
        ),
      ),
    );
  }
}