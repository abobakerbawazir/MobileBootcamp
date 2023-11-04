import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//List of Cards with size

//List of Cards with color and icon

class sss extends StatelessWidget {
  const sss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Staggered Grid View starts here
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  color: Colors.red,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.blue,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.orange,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Container(
                  color: Colors.pink,
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: Container(
                  color: Colors.purple,
                )),
          ],
        ),
      ),
    );
  }
}

class Starged1 extends StatefulWidget {
  const Starged1({super.key});

  @override
  State<Starged1> createState() => _Starged1State();
}

class _Starged1State extends State<Starged1> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.5,
                        child: Card(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("طلقة بلاس",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("توصيل سريع لاي شي من وإللى أي مكان"),
                                  Image.asset("assets/imagesFoots/talqa1.png"),
                                ],
                              )),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.8,
                        child: Card(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Positioned(
                                      top: 75,
                                      left: 40,
                                      child: SizedBox(
                                          height: 150,
                                          width: 90,
                                          child: Image.asset(
                                              "assets/imagesFoots/talqa2.png"))),
                                  Text(
                                    "متاجر",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Positioned(
                                    top: 20,
                                    child: Text(
                                        "تسوق واشتر كل احتياجاتك\n(فواكه وخضروات وعطور\n واكسسوارات و ملابس \nو احذية.. من أضخم\n المحلات بغطة زر)"),
                                  ),
                                ],
                              )),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.8,
                        child: Card(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("دوائي",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      "أي علاج تحتاجه في أي وقت نوفره لك من أي صيدلية إلى بيتك"),
                                  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                          "assets/imagesFoots/talqa3.png")),
                                ],
                              )),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.5,
                        child: Card(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("وصلني",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("مشاويرك لا تشيل همها"),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                      // height: 100,
                                      // width: 100,
                                      child: Image.asset(
                                          "assets/imagesFoots/talqa4.png")),
                                ],
                              )),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2.5,
                        child: Card(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Text("شركاء في الخير",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Positioned(
                                    top: 30,
                                    
                                    child: Text(
                                        "الناس للناس والدنيا بخير\n.نوصل لك تبرعاتك العينية\n لأي مؤسسة خيرية مجانا"),
                                  ),
                                  Positioned(top: 120,left: 50,
                                    child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                            "assets/imagesFoots/talqa5.png")),
                                  ),
                                ],
                              )),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
