import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoursolSliderWidget extends StatefulWidget {
  const CoursolSliderWidget({super.key});

  @override
  State<CoursolSliderWidget> createState() => _CoursolSliderWidgetState();
}

class _CoursolSliderWidgetState extends State<CoursolSliderWidget> {
  List<String> listsImagesFoots = List.generate(
    15,
    (index) {
      return "assets/imagesFoots/${index + 1}.jpeg";
    },
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
          options: CarouselOptions(
              height: 400,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3)),
          items: listsImagesFoots.map(
            (e) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  // SizedBox(height: 100,width: 100,
                  //   child: GridView.builder(
                  //     itemCount: 15,
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2, childAspectRatio: 1),
                  //     itemBuilder: (context, index) {
                  //       return Image.asset("assets/imagesFoots/${index+1}.jpeg");
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    width: 300,
                    height: 170,
                    child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(e),
                            ))),
                  ),
                ],
              );
            },
          ).toList()
          // Image.asset("assets/imagesFoots/1 (24).jpeg"),
          // Container(
          //   color: Colors.red,
          //   height: 200,
          //   width: 200,
          // ),
          // Container(
          //   color: Colors.purple,
          //   height: 200,
          //   width: 200,
          // ),
          // Container(
          //   color: Colors.blue,
          //   height: 200,
          //   width: 200,
          // ),
          ),
    );
  }
}
