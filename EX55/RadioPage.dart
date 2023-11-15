// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Costom_Plan_Components extends StatefulWidget {
  Costom_Plan_Components(
      {super.key,
      // required this.listRadio,
      required this.y2});
  late List<Map<String, dynamic>> y2;
  //late List<String> listRadio;

  @override
  State<Costom_Plan_Components> createState() => _Costom_Plan_ComponentsState();
}

class _Costom_Plan_ComponentsState extends State<Costom_Plan_Components> {
  String? selectedValue;
  Color? c;

  late List<Map<String, dynamic>> y;

  late List<String> x;

  // List<NameItems> list = [
  //   NameItems(nmae: "nmaef"),
  //   NameItems(nmae: "nmaed"),
  //   NameItems(nmae: "nmae")
  // ];
  @override
  void initState() {
    y = widget.y2;
    //x = widget.listRadio;
    //selectedValue = widget.listRadio.first;
    //selectedValue = list[0].nmae;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c,
      ),
      body: Column(
          children: List.generate(
        y.length,
        (index) {
          final size = y[index]["name"];
          return Row(
            children: [
              Radio<String>(
                activeColor: Colors.black,
                value: size,
                groupValue: selectedValue,
                onChanged: (value) {
                  selectedValue = value as String;
                  c = y[index]["colors"];
                  setState(() {});
                },
              ),
              Text(
                "${y[index]["name"]}",
                style: TextStyle(fontSize: 15),
              ),
              
            ],
          );
        },
      )
          //   List.generate(x.length, (index) {
          //     final size = x[index];

          //     return Row(
          //       children: [
          //         Radio<String>(
          //           activeColor: Colors.black,
          //           // focusColor: Colors.yellow,
          //           //hoverColor: Colors.yellow,
          //           //mouseCursor: MouseCursor.defer,
          //           value: size,
          //           groupValue: selectedValue,
          //           onChanged: (value) {
          //             selectedValue = value!;
          //             setState(() {});
          //           },
          //         ),
          //         Container(
          //             height: 40, width: 40, color: Color.fromRGBO(0, 150, 136, 1)),
          //         Text(
          //           "${x[index]}",
          //           style: TextStyle(fontSize: 15),
          //         ),
          //       ],
          //     );
          //   }),

          ),
    );
  }
}
