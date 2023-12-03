import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';

class MyTextFormField extends StatelessWidget {
  InputBorder? border;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  String? labeltext;
  Widget? suffixIcon;
  String? hintText;
  bool? obscureText;
  bool? readOnly;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  TextEditingController? controller;
  MyTextFormField(
      {super.key,
      required this.controller,
      this.inputFormatters,
      this.readOnly,
      this.validator,
      this.obscureText,
      this.hintText,
      this.suffixIcon,
      this.labeltext,
      this.keyboardType,
      this.prefixIcon,
      this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        color: c3,
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          inputFormatters: inputFormatters,
          readOnly: readOnly ?? false,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            border: border ?? InputBorder.none,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            labelText: labeltext,
          ),
        ),
      ),
    );
  }
}
