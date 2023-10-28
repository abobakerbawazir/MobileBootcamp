// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Costom_Plan_Components extends StatefulWidget {
  Costom_Plan_Components({super.key, required this.listRadio});

  late List<String> listRadio;

  @override
  State<Costom_Plan_Components> createState() => _Costom_Plan_ComponentsState();
}

class _Costom_Plan_ComponentsState extends State<Costom_Plan_Components> {
  late String selectedValue;
  late List<String> x; // List<NameItems> list = [
  //   NameItems(nmae: "nmaef"),
  //   NameItems(nmae: "nmaed"),
  //   NameItems(nmae: "nmae")
  // ];
  @override
  void initState() {
    x = widget.listRadio;
    selectedValue = widget.listRadio.first;
    //selectedValue = list[0].nmae;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(x.length, (index) {
        final size = x[index];

        return Row(
          children: [
            Radio<String>(
              activeColor: Colors.yellow,
              focusColor: Colors.yellow,
              //hoverColor: Colors.yellow,
              //mouseCursor: MouseCursor.defer,
              value: size,
              groupValue: selectedValue,
              onChanged: (value) {
                selectedValue = value!;
                setState(() {});
              },
            ),
            Text(
              "${x[index]}",
              style: TextStyle(fontSize: 10),
            ),
          ],
        );
      }),
    );
  }
}
