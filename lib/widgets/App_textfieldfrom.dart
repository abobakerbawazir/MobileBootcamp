import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class My_textformFiled extends StatelessWidget {
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatterss;
  TextEditingController? controller;
  String x;
  My_textformFiled(
      {super.key, this.controller, required this.x, this.inputFormatterss,this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: inputFormatterss,
      controller: controller,
      decoration: InputDecoration(
        labelText: x,
      ),
    );
  }
}
