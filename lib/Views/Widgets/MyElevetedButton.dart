import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyElevatedButton extends StatelessWidget {
  double? height, top, right, left, width, bottom, fontSize;
  late Color backgroundColor, foregroundColor;
  late String text;
  void Function()? onPressed;
  MyElevatedButton(
      {super.key,
      this.bottom,
      this.top,
      this.left,
      this.right,
      this.height,
      this.width,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.onPressed,
      required this.text,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: bottom ?? 5,
          top: top ?? 5,
          right: right ?? 20,
          left: left ?? 20),
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize ?? 18),
          )),
    );
  }
}
