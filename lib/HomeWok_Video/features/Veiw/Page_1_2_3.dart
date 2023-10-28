import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video/HomeWok_Video/core/components/buildPage1_2_3.dart';
import 'package:video/HomeWok_Video/features/Veiw/Sign_in.dart';

class Page_1_2_3 extends StatefulWidget {
  const Page_1_2_3({super.key});

  @override
  State<Page_1_2_3> createState() => _Page_1_2_3State();
}

class _Page_1_2_3State extends State<Page_1_2_3> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Widget buildPage1_2_3(
  //     {required IconData icon,
  //     required String title,
  //     required String deatials}) {
  //   return ListView(
  //     children: [
  //       Container(
  //           decoration: const BoxDecoration(
  //             image: DecorationImage(
  //                 opacity: 0.3,
  //                 image: AssetImage("assets/images/5.jpg"),
  //                 fit: BoxFit.cover),
  //             color: Colors.black,
  //           ),
  //           child: Column(children: [
  //             SizedBox(
  //               height: MediaQuery.of(context).size.height / 2,
  //             ),
  //             Container(
  //               color: const Color.fromARGB(255, 49, 48, 48),
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(
  //                         left: 10, right: 300, top: 20, bottom: 20),
  //                     child: Icon(icon, color: Colors.yellow, size: 80),
  //                   ),
  //                   Container(
  //                     padding: const EdgeInsets.only(
  //                         left: 25, bottom: 10, top: 10, right: 25),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(title,
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontWeight: FontWeight.bold)),
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                     padding: const EdgeInsets.only(
  //                         left: 25, bottom: 10, top: 10, right: 25),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(deatials,
  //                             style: TextStyle(
  //                                 color: Color.fromARGB(255, 185, 183, 183),
  //                                 fontWeight: FontWeight.normal)),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 200,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ])),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            BuildPage1_2_3(
                icon: Icons.yard,
                title: "WATCH ON ANY DEVICE",
                deatials: "Connect to using your farvorite\ndevices."),
            BuildPage1_2_3(
                icon: Icons.yard,
                title: "UNLIMITED ENTERTAINMENT",
                deatials:
                    "I am an early bird and i am a night owl\nso i am wise and I have worms."),
            BuildPage1_2_3(
                icon: Icons.yard,
                title: "NO ANNOYING CONTRACTS",
                deatials:
                    "I am an early brid and I am night owl\nso I am wise and I have worms."),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () async {
                Navigator.of(context).pushReplacementNamed('/sign_in');
              },
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 24),
              ))
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text("Skip")),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700),
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text("Next"))
                ],
              ),
            ),
      //buildPage(icon: Icons.yard, title: "title", deatials: "deatials")

      //     ListView(
      //   children: [
      //     Container(
      //         decoration: const BoxDecoration(
      //           image: DecorationImage(
      //               opacity: 0.3,
      //               image: AssetImage("assets/images/5.jpg"),
      //               fit: BoxFit.cover),
      //           color: Colors.black,
      //         ),
      //         child: Column(children: [
      //           SizedBox(
      //             height: MediaQuery.of(context).size.height / 2,
      //           ),
      //           Container(
      //             color: const Color.fromARGB(255, 49, 48, 48),
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(
      //                       left: 10, right: 300, top: 20, bottom: 20),
      //                   child:
      //                       Icon(Icons.ad_units, color: Colors.yellow, size: 80),
      //                 ),
      //                 Container(
      //                   padding: const EdgeInsets.only(
      //                       left: 25, bottom: 10, top: 10, right: 25),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: const [
      //                       Text("Card Number",
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontWeight: FontWeight.bold)),
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                   padding: const EdgeInsets.only(
      //                       left: 25, bottom: 10, top: 10, right: 25),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: const [
      //                       Text("Card Number",
      //                           style: TextStyle(
      //                               color: Color.fromARGB(255, 185, 183, 183),
      //                               fontWeight: FontWeight.normal)),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 200,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ])),
      //   ],
      // )
    );
  }
}
