import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/Costom_Plan_page.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';

class Payment_15_page extends StatefulWidget {
  const Payment_15_page({super.key});

  @override
  State<Payment_15_page> createState() => _Payment_15_pageState();
}

class _Payment_15_pageState extends State<Payment_15_page> {
  bool isExp = false;
  late String name;
  // List<Widget> card = [Container()];
  List<Map<String, dynamic>> card = [
    {
      "imagepath": "assets/images/VisaCard.png",
      "name": "Visa",
      "icon": Icons.check_circle,
      "isIcon": false
    },
    {
      "imagepath": "assets/images/masterCardContainer.png",
      "icon": Icons.check_circle,
      "name": "Master Card",
      "isIcon": false
    },
    {
      "imagepath": "assets/images/Paypalcard.png",
      "name": "Paypal",
      "icon": Icons.check_circle,
      "isIcon": false
    }
  ];
  @override
  void initState() {
    name = card[0]["name"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CATEGORY"),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: card.map(
                (e) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (e["isIcon"] == false
                                              // &&
                                              //     name == e["name"]
                                              ) {
                                            // name == e["name"];
                                            e["isIcon"] = true;
                                          } else {
                                            //name == e["name"];
                                            e["isIcon"] = false;
                                          }
                                          setState(() {});
                                        },
                                        child: e["isIcon"] == false
                                            ? Image.asset(
                                                e["imagepath"]!,
                                              )
                                            : Image.asset(
                                                e["imagepath"]!,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(e["name"]!)
                                    ],
                                  ),
                                  Positioned(
                                      top: 10,
                                      left: 40,
                                      child: e["isIcon"] == true
                                          //  &&
                                          //         name == e["name"]
                                          ? Icon(
                                              e["icon"],
                                              color: Colors.yellow,
                                            )
                                          : Text("")),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ExpansionPanelList(
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text("Master Card"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: Image.asset(
                                                "assets/images/circle.png")),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("****************456")
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ));
                      },
                      body: Row(
                        children: [Text("Master Card")],
                      ))
                ],
              ),
            ),
            Stack(
              children: [
                Elevated_button_sign_in(left: 10,right: 10,
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    backgroundColor: Color.fromARGB(255, 121, 116, 116),
                    foregroundColor: Colors.yellow,
                    onPressed: () {},
                    text: "ADD NEW CARD"),
                Positioned(
                    left: 110,
                    top: 22,
                    child:
                        Icon(Icons.add_circle_outline, color: Colors.yellow)),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.8,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Total : 543"),
                ],
              ),
            ),
            Elevated_button_sign_in(width: MediaQuery.of(context).size.width,
                    height: 70,left: 10,right: 10,
                backgroundColor: Color.fromARGB(255, 121, 116, 116),
                foregroundColor: Colors.yellow,
                onPressed: () {},
                text: "PAY&CONFIRM")
          ],
        ),
      )),
    );
  }
}
