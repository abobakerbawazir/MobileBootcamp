import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RestaurantsPagecarousel_slider extends StatefulWidget {
  const RestaurantsPagecarousel_slider({super.key});

  @override
  State<RestaurantsPagecarousel_slider> createState() => _RestaurantsPagecarousel_sliderState();
}

class _RestaurantsPagecarousel_sliderState extends State<RestaurantsPagecarousel_slider> {
  List<String> listsImagesFoots = List.generate(
    15,
    (index) {
      return "assets/imagesFoots/${index + 1}.jpeg";
    },
  );
  @override
  Widget build(BuildContext context) {
    return 
      
       CarouselSlider(
          items: listsImagesFoots.map((e) {
            return Container(margin: EdgeInsets.all(5),padding:EdgeInsets.all(5) ,
                        // width: 300,
                        // height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(e),
                            )));
          }).toList(),
          options: CarouselOptions(
             // height: 400,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3))
    );
  }
}
