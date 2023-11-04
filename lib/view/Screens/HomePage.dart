import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';
import 'package:talqa_design/view/Widget/Staggered_Gred_view/Staggered1.dart';
import 'package:talqa_design/view/Widget/carousel_slider/CoursolSliderWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Directionality(
    //   textDirection: TextDirection.rtl,
    //   child: Text(""),
    // );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          color: Color(0xffF6F7FB),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  MyHomePageClipPath(),
                  Positioned(
                      left: 20,
                      top: 55,
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
                            Icons.notifications,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )),
                  Positioned(
                    right: 20,
                    top: 70,
                    child: Text(
                      "أهلا وسهلا,Abobaker😍",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: CoursolSliderWidget())),
                  // Positioned(top: 100,left: 70,
                  //   child: Container(
                  //     height: 100,
                  //     width: 100,
                  //     decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(50)),
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: 120,
              ),
              Card(
                  margin: EdgeInsets.all(20),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "    توصيل الطعام",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ListTile(
                            trailing:
                                Image.asset("assets/imagesFoots/talaq6.png"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "لا تشيل هم الجوع..طعام ,شراب , واجبات سريعة",
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text("أكل بيت , حلويات , إيسكريم , كله موجود",
                                    style: TextStyle(fontSize: 11)),
                                Text("ومن أفخم الأماكن",
                                    style: TextStyle(fontSize: 11))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Starged1())
            ],
          ),
        )),
      ),
    );
  }
}

class ListViewBiulderScrool1 extends StatefulWidget {
  const ListViewBiulderScrool1({super.key});

  @override
  State<ListViewBiulderScrool1> createState() => _ListViewBiulderScrool1State();
}

class _ListViewBiulderScrool1State extends State<ListViewBiulderScrool1> {
  List<String> categories = [
    'Football',
    'Basketball',
    'Tennis',
  ];

  List<List<String>> achievements = [
    [
      'World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg,World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg',
      'World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg,World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg'
    ],
    [
      'NBA Championship',
      'MVP Award',
      'All-Star Game',
      'World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg,World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg',
      'World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg,World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg'
    ],
    [
      'Grand Slam',
      'Davis Cup',
      'Olympic Gold Medal',
      'World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg,World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg',
      'World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg,World Cup',
      'Champions League',
      'Golden Ball',
      'dfghgg'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int categoryIndex) {
            String category = categories[categoryIndex];
            List<String> categoryAchievements = achievements[categoryIndex];

            return ListTile(
              title: Text(category),
              subtitle: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categoryAchievements.length,
                itemBuilder: (BuildContext context, int achievementIndex) {
                  String achievement = categoryAchievements[achievementIndex];
                  return Text(achievement);
                },
              ),
            );
          },
        ));
  }
}
