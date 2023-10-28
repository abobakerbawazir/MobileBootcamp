import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuildPage1_2_3 extends StatelessWidget {
  // required IconData icon,
  //     required String title,
  //     required String deatials}
  late IconData icon;
  late String title;
  late String deatials;
  BuildPage1_2_3({super.key,required this.icon,required this.title,required this.deatials});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 0.3,
                  image: AssetImage("assets/images/5.jpg"),
                  fit: BoxFit.cover),
              color: Colors.black,
            ),
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Container(
                color: const Color.fromARGB(255, 49, 48, 48),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 300, top: 20, bottom: 20),
                      child: Icon(icon, color: Colors.yellow, size: 80),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 25, bottom: 10, top: 10, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(deatials,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 185, 183, 183),
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ])),
      ],
    );
  }
}
