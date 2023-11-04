import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';
import 'package:talqa_design/view/Widget/Restaurantscarousel_slider.dart';

class ReastarentPage extends StatefulWidget {
  const ReastarentPage({super.key});

  @override
  State<ReastarentPage> createState() => _ReastarentPageState();
}

class _ReastarentPageState extends State<ReastarentPage> {
  int countter = -1;
  List<String> categories = [
    'الكل',
    'مطاعم',
    'وجبات سريعة',
    'كافيهات',
    'أكلات بيت',
    'لحوم وأسماك',
    'حلويات ومخابز',
    'أيسكريم',
    'مشروبات',
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //appBar: AppBar(backgroundColor: Color(0xff285A95),),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  MyHomePageClipPath(),
                  Positioned(
                    top: 45,
                    right: 150,
                    child: Text(
                      "مطاعم",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 45,
                      child: InkWell(
                        onTap: () {
                          print("object");
                          setState(() {});
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff5177A4),
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )),
                  Positioned(
                      top: 100,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: RestaurantsPagecarousel_slider())),
                ],
              ),
              SizedBox(
                height: 140,
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: countter == index
                              ? Color(0xff285A95)
                              : Color.fromARGB(255, 226, 225, 225),
                          borderRadius: BorderRadius.circular(30)),
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          print("object");
                          countter = index;
                          setState(() {});
                        },
                        child: Center(
                          child: Row(
                            children: [
                              CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/imagesFoots/4.jpeg")),
                              Center(
                                  child: Text(
                                categories[index],
                                style: TextStyle(
                                    color: countter == index
                                        ? Colors.white
                                        : null),
                              )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("جميع المطاعم"),
                    SizedBox(
                      width: 130,
                      child: InkWell(
                        onTap: () {
                          print("object");
                        },
                        child: Card(
                          //margin: EdgeInsets.all(10),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(child: Text("المقترحة لك")),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                child: Image.asset("assets/imagesFoots/a2.png"),
              ),
              Card(
                child: Image.asset("assets/imagesFoots/a2.png"),
              ),
              Card(
                child: Image.asset("assets/imagesFoots/a2.png"),
              ),
              Card(
                child: Image.asset("assets/imagesFoots/a2.png"),
              ),
              Card(
                child: Image.asset("assets/imagesFoots/a2.png"),
              ),
              Card(
                child: Image.asset("assets/imagesFoots/a2.png"),
              )
            ],
          ),
        )),
      ),
    );
  }
}
