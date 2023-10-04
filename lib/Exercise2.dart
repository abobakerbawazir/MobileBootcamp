

import 'package:flutter/material.dart';

class Ecercise2 extends StatelessWidget {
  const Ecercise2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Material App Bar",style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,
    ),
    body: Container(
      child: Column(
        children: [
          Expanded(
            child: Container(child: Center(child: Text("1",style: TextStyle(fontSize: 50),)),
                // padding: EdgeInsets.all(10),
                width: 400,
                height: 300,
                color: Colors.red,
              ),
          ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(child: Center(child: Text("2",style: TextStyle(fontSize: 50),)),
                // padding: EdgeInsets.all(10),
                width: 100,
                height: 400,
                color: Colors.green,),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [Expanded(
                        child: Container(child: Center(child: Text("3",style: TextStyle(fontSize: 50),)),
                // padding: EdgeInsets.all(10),
                width: 400,
                height: 400,
                color: Colors.yellow,),
                      ),
                Expanded(
                  child: Container(child: Center(child: Text("4",style: TextStyle(fontSize: 50),)),
                  // padding: EdgeInsets.all(10),
                  width: 400,
                  height: 400,
                  color: Colors.purpleAccent,),
                ),],
                    )
                  )

                  ],
                ),
              ),
            ),
        ],
      ),
    )
    ,);
  }
}