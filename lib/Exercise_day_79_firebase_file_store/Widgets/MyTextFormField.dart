import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({super.key,this.controller,required this.hintText,this.readOnly,this.suffixIcon});
  late String hintText;
  TextEditingController? controller; 
  bool? readOnly;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xfff8f9fb), borderRadius: BorderRadius.circular(10)),
      child: TextFormField(controller: controller,readOnly: readOnly??false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
    );
  }
}
