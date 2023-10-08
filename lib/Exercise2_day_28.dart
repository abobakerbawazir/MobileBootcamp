import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Exercise_2_day_28 extends StatefulWidget {
  const Exercise_2_day_28({super.key});

  @override
  State<Exercise_2_day_28> createState() => _Exercise_2_day_28State();
}

class _Exercise_2_day_28State extends State<Exercise_2_day_28> {
  int counter = 0;
  List<String> texts = [];
  void addText() {
    String newText = 'Text ${counter + 1}';
    setState(() {
      texts.add(newText);
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Add Widgets Dynamically"),),
    body: Container(padding: EdgeInsets.all(10)
    ,child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      
      SizedBox(height: 20,),
      Expanded(child: ListView.builder(itemCount: texts.length,itemBuilder:(context, index) {
        String text=texts[index];
        return ListTile(title: Text(text),);
        
      },)),ElevatedButton(onPressed: addText, child: Text("ADD TEXT WIDGET")),

    ]),),);
  }
}
