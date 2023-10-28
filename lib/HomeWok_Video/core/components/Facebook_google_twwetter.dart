import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Google_Facebook_Towetter extends StatelessWidget {
  late double height;
  late String text1, text2, typesign;
   void Function()? onPressed;
  Google_Facebook_Towetter(
      {super.key,required this.onPressed,
      required this.height,
      required this.text1,
      required this.text2,
      required this.typesign});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            SizedBox(
                height: 45,
                width: 45,
                child: Image.asset("assets/images/google1.png")),
            SizedBox(
              width: 10,
            ),
            SizedBox(
                height: 45,
                width: 45,
                child: Image.asset("assets/images/facebook.png")),
            SizedBox(
              width: 10,
            ),
            SizedBox(
                height: 45,
                width: 45,
                child: Image.asset("assets/images/towtter.png")),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: height,
        ),
        Row(
          children: [
            Text(
              text2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                typesign,
                style: TextStyle(
                  color: Color.fromARGB(255, 222, 201, 9),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
