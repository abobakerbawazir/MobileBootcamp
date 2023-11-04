import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talqa_design/view/Screens/SignUp.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int countter = 0;
  List<String> list = ["الحالية", "السابقة"];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  MyHomePageClipPath(),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: Text(
                      "طلباتي",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 20,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 70,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                list.length,
                                (index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: countter == index
                                            ? Colors.orange
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: TextButton(
                                        onPressed: () {
                                          countter == index;
                                          if (countter <= index) {
                                            countter++;

                                            print(
                                                "countter $countter AND index $index");
                                          } else {
                                            countter--;
                                            // Navigator.push(context,
                                            //     MaterialPageRoute(
                                            //   builder: (context) {
                                            //     return SignUp();
                                            //   },
                                            // ));
                                            print(
                                                "countter $countter AND index $index");
                                          }
                                          setState(() {});
                                        },
                                        child: Text(
                                          list[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: countter == index
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 18),
                                        )),
                                  );
                                },
                              )
                              // list.map(
                              //   (e) {
                              //     return Text(
                              //       e,
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           color: Colors.white,
                              //           fontSize: 18),
                              //     );
                              //   },
                              // ).toList(),
                              // children: [
                              //   Text(
                              //     "الحالية",
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white,
                              //         fontSize: 18),
                              //   ),
                              //   Text(
                              //     "السابقة",
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.white,
                              //         fontSize: 18),
                              //   )
                              // ],
                              ),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.7,
              ),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset("assets/imagesFoots/sala.png")),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: Text("قائمة طلباتي فارغة",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30))),
              Center(
                child: Text(
                  "ليس لديك أي طلبات حتى الأن",
                  style: TextStyle(
                      color: Color(0xff878F9F),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
