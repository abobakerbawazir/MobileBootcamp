import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListIsEmpty extends StatefulWidget {
  const ListIsEmpty({super.key});

  @override
  State<ListIsEmpty> createState() => _ListIsEmptyState();
}

class _ListIsEmptyState extends State<ListIsEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "PAYMENT MOTHED",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 49, 48, 48),
        ),
        body: Container(
          color: Color.fromARGB(255, 49, 48, 48),
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  height: 3,
                ),
                Container(
                  height: 200,
                ),
                Icon(
                  Icons.list,
                  size: 150,
                  color: Colors.yellow,
                ),
                Text(
                  "YOUR LIST IS EMPTY!",
                  style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                ),
                Container(
             
                  height: 8,
                ),
                Text(
                  "Contrary to popular belief, Lorem \nI psum is not simply rand",
                  style: TextStyle(color: Colors.white,fontSize: 15,),
                ),
              ],
            ),
          ),
        ));
  }
}
