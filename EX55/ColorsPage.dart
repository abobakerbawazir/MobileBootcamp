import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mukalla_store/EX55/RadioPage.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({super.key});

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  List<String> x = ["a", "b", "c"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // appBar: AppBar(),
        body: Costom_Plan_Components(
          y2: [
            {"name": "Tail", "colors": Colors.teal},
            {"name": "Pink", "colors": Colors.pink},
            {"name": "Indigo", "colors": Colors.indigo}
          ],
        ));
  }
}
