import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';

class FovriteWidget extends StatefulWidget {
  const FovriteWidget({super.key});

  @override
  State<FovriteWidget> createState() => _FovriteWidgetState();
}

class _FovriteWidgetState extends State<FovriteWidget> {
   int countter = 0;
  List<String> list = ["أصناف/خدمات", "مطاعم/منشأت"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  MyHomePageClipPath(),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: Text(
                      "المفضلة",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff5177A4),
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            )),
                      ),
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
            ),
            Card(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: Container(
                //padding: EdgeInsets.all(50),
                height: 120,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: Container(
                //padding: EdgeInsets.all(50),
                height: 120,
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        ),
      )),
    );
  }
}
