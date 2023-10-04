import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Material App Bar",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Stack(
              alignment: Alignment
                  .topLeft /*by default alignment is alignment: Alignment.topLeft*/,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  height: 300,
                  width: 400,
                  // color: Colors.purple,
                ),
                Positioned(
                  bottom: 80,
                  right: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 227, 136, 243),
                        borderRadius: BorderRadius.circular(100)),
                    height: 140,
                    width: 140,
                    //color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 100,
                  right: 120,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    height: 100,
                    width: 100,
                    //color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 250, left: 30,
                  child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  //ListTile(title: Text("150%"), subtitle: Text("qwww")),
                                  //ListTile(title: Text("150%"), subtitle: Text("qwww")),
                                  A(),A()
                                  
                                ],
                              ),
                            ),
                          ),Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  //ListTile(title: Text("150%"), subtitle: Text("qwww")),
                                  //ListTile(title: Text("150%"), subtitle: Text("qwww")),
                                  A(),A()
                                  
                                ],
                              ),
                            ),
                          ),git 
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 141, 136, 134),
                          borderRadius: BorderRadius.circular(50))),
                  height: 170,
                  width: 300,

                  // color: Colors.purple,
                ),
              ]),
        ));
  }
}

A() {
  List<String> x = ["150%", "qwww"];
  return ListTile(title: Text(x[0]),subtitle: Text(x[1]),);
  
}
