import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/Costom_Plan_page.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';

class Costom_Plan_Page extends StatefulWidget {
  const Costom_Plan_Page({super.key});

  @override
  State<Costom_Plan_Page> createState() => _Costom_Plan_PageState();
}

class _Costom_Plan_PageState extends State<Costom_Plan_Page> {
  bool isExp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Costom_Plan_Page"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(left: 10), child: Text("DURATION")),
            Costom_Plan_Components(
                listRadio: ["07 days", "15 days", "01 month", "01 year"]),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 1,
              color: Color.fromARGB(255, 172, 162, 162),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text("VIDEO QUALITY")),
            Costom_Plan_Components(listRadio: ["Good", "Better", "Best"]),
            Container(
              height: 1,
              color: Color.fromARGB(255, 172, 162, 162),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text("DEVICES")),
            Container(
                padding: EdgeInsets.only(left: 10, top: 4),
                child: Text("Screens you can watch on at\nthe same time")),
            SizedBox(
              height: 25,
            ),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                if (isExp == false) {
                  isExp = true;
                } else {
                  isExp = false;
                }
                setState(() {});
              },
              children: [
                ExpansionPanel(
                    isExpanded: isExp,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text("Choose Number of Devices"));
                    },
                    body:
                        Costom_Plan_Components(listRadio: ["1", "2", "3", "4"]))
              ],
            ),
            Container(
              height: 1,
              color: Color.fromARGB(255, 172, 162, 162),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text("CANCEL AT ANY TIME")),
            Costom_Plan_Components(listRadio: ["Yes", "No"]),
            Container(
              height: 1,
              color: Color.fromARGB(255, 172, 162, 162),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Elevated_button_sign_in(
                backgroundColor: Color.fromARGB(255, 79, 76, 76),
                foregroundColor: Colors.yellow,
                onPressed: () {Navigator.pushNamed(
                              context,
                            "/payment_Method_13");},
                text: "CONTINUE \$89",
                height: 60,
                width: MediaQuery.of(context).size.width,
              ),
            ), Container(
              margin: EdgeInsets.only(top: 10, bottom: 5,right: 75),
              
              child: Container(margin: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text("By signing up you agree to our Privacy",style: TextStyle(fontSize: 12),),
                    
                  ],
                ),
              ),
            ),Container(
              margin: EdgeInsets.only(top: 5, bottom: 5,left: 20),
              
              child: Column(
                children: [
                  Text("Policy and Terms",style: TextStyle(color: Colors.yellow),),
                  
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
