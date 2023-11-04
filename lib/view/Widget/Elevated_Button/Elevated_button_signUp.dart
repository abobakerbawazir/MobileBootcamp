import 'package:flutter/material.dart';

class Elevated_button_signUp extends StatelessWidget {
  double? fontSize;
  double? bottom;
  double? height, top, right, left;
  double? width;
  late Color backgroundColor;
  late Color foregroundColor;
  late String text;
  void Function()? onPressed;
  Elevated_button_signUp(
      {super.key,this.fontSize,
      this.bottom,
      this.top,
      this.left,
      this.right,
      this.height,
      this.width,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.onPressed,
      required this.text});

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
            style: TextStyle(fontSize: fontSize??20),
          )),
    );
  }
}
