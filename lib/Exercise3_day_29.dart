import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Ecercise3_day_29 extends StatelessWidget {
  const Ecercise3_day_29({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            Container(
                child: Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ))
          ],
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                "For you",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4)),
              ),
            ),
            Tab(
              child: Text(
                "Latest",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4)),
              ),
            ),
            Tab(
              child: Text(
                "Transfer",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            Tab(
              child: Text(
                "Legues",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4)),
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Text(""),
            Text(""),
            Column(
              children: [
Container(height: 10,),
                      Expanded(
                        child: Container(
                          child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [   Positioned(
                                child: Container(
                                     
                                            height: 350,
                                            width: 250,
                                            child: Image.asset("assets/images/2.jpg")),
                              ),
                              
                          

                                          Positioned(bottom: 0,left: 140,
                                            child: Container(
                                   
                                            height: 100,
                                            width: 100,
                                            child: Image.asset("assets/images/11.png")),
                                          ),Positioned(left: 190,top: 10,child: Text("Today")),
                                          Positioned(left: 40,top: 15,child: Text("4.5 .Jersey 1")),
                                          Positioned(left: 15,top: 10,child: Icon(Icons.star)),
                                          Positioned(left: 20,top: 35,child: Text("Hugo Lloris",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                          Positioned(left: 20,top: 65,child: Text("Goalkeeper . French",style: TextStyle(fontSize: 12),)),
                                           Positioned(left: 25,top: 110,child: Row(
                                            children: [Container(height: 20,
                                            width: 20,child: Image.asset("assets/images/11.png")),Icon(Icons.arrow_forward_sharp),Container(height: 20,
                                            width: 20,child: Image.asset("assets/images/11.png")),],
                                           )),
                                       
                              ]
                          
                              ),
                        ),
                      ),Container(height: 10,),
                           Expanded(
                        child: Container(
                          child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [   Positioned(
                                child: Container(
                                     
                                            height: 350,
                                            width: 250,
                                            child: Image.asset("assets/images/2.jpg")),
                              ),
                              
                          

                                          Positioned(bottom: 0,left: 140,
                                            child: Container(
                                   
                                            height: 100,
                                            width: 100,
                                            child: Image.asset("assets/images/11.png")),
                                          ),Positioned(left: 190,top: 10,child: Text("Today")),
                                          Positioned(left: 40,top: 15,child: Text("4.5 .Jersey 1")),
                                          Positioned(left: 15,top: 10,child: Icon(Icons.star)),
                                          Positioned(left: 20,top: 35,child: Text("Hugo Lloris",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                          Positioned(left: 20,top: 65,child: Text("Goalkeeper . French",style: TextStyle(fontSize: 12),)),
                                           Positioned(left: 25,top: 110,child: Row(
                                            children: [Container(height: 20,
                                            width: 20,child: Image.asset("assets/images/11.png")),Icon(Icons.arrow_forward_sharp),Container(height: 20,
                                            width: 20,child: Image.asset("assets/images/11.png")),],
                                           )),
                                       
                              ]
                          
                              ),
                        ),
                      ),Container(height: 10,),
                         
                        
                        Expanded(
                        child: Container(
                          child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [   Positioned(
                                child: Container(
                                     
                                            height: 350,
                                            width: 250,
                                            child: Image.asset("assets/images/2.jpg")),
                              ),
                              
                          

                                          Positioned(bottom: 0,left: 140,
                                            child: Container(
                                   
                                            height: 100,
                                            width: 100,
                                            child: Image.asset("assets/images/11.png")),
                                          ),Positioned(left: 190,top: 10,child: Text("Today")),
                                          Positioned(left: 40,top: 15,child: Text("4.5 .Jersey 1")),
                                          Positioned(left: 15,top: 10,child: Icon(Icons.star)),
                                          Positioned(left: 20,top: 35,child: Text("Hugo Lloris",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                          Positioned(left: 20,top: 65,child: Text("Goalkeeper . French",style: TextStyle(fontSize: 12),)),
                                           Positioned(left: 25,top: 110,child: Row(
                                            children: [Container(height: 20,
                                            width: 20,child: Image.asset("assets/images/11.png")),Icon(Icons.arrow_forward_sharp),Container(height: 20,
                                            width: 20,child: Image.asset("assets/images/11.png")),],
                                           )),
                                       
                              ]
                          
                              ),
                        ),
                      ),Container(height: 10,),
                        
                    
              ],
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}
