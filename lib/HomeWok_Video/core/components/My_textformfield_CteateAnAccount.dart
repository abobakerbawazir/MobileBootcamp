import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class My_Textformfield_CreateanAccount extends StatelessWidget {
  //IconData? iconData;
  Widget? suffixIcon;
  TextEditingController? controller;
  late String labeltext;
  bool obscureText = false;
  //void Function()? onPressed;
  // IconButton? iconButton;
  My_Textformfield_CreateanAccount(
      {super.key,
      this.controller,
     // this.iconButton,
      //this.iconData,
      required this.labeltext,required this.obscureText,this.suffixIcon
      //this.onPressed
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labeltext,
          fillColor: Colors.white,
          hoverColor: Colors.white,
          focusColor: Colors.white),
    );
  }
}
