import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Countainer_button extends StatelessWidget {
  late String name_text,name_button;
   Countainer_button({super.key,required this.name_text,required this.name_button});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, top: 5, right: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              name_text,
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
                onPressed: () {},
                child:  Text(
                  name_button,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ))
          ],
        ));
  }
}
