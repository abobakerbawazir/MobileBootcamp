//exercise 1
import 'package:flutter/material.dart';

class Exerxise1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marerial App Bar"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(10),
              width: 400,
              height: 300,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(10),
              width: 400,
              height: 300,
              color: Colors.red,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class A extends StatelessWidget {
  late String name;
  A({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      padding: EdgeInsets.all(10), width: 200, height: 200,
      // color: Colors.red,
      child: Center(
        child: Text(
          "inside container",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
