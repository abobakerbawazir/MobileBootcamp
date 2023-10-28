import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/features/Controller/VideoController/VideoController.dart';

class ListViewBuilderHomePage_button extends StatefulWidget {
  const ListViewBuilderHomePage_button({super.key});

  @override
  State<ListViewBuilderHomePage_button> createState() =>
      _ListViewBuilderHomePage_buttonState();
}

class _ListViewBuilderHomePage_buttonState
    extends State<ListViewBuilderHomePage_button> {
  VideoController videoController = VideoController();
  @override
  void initState() {
    videoController.icon_name_Map;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: videoController.icon_name_Map.length,
          itemBuilder: (context, index) {
            return Container(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/PaymentMethod14");
                },
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 80,
                          height: 80,
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //       image: AssetImage(images_one_builder[index]),
                          //       fit: BoxFit.cover),
                          //   color: Colors.red,
                          //   borderRadius: BorderRadius.circular(5),
                          // ),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              left: 5, top: 10, bottom: 10, right: 5),
                          child: Icon(videoController.icon_name_Map[index]['icon'],
                              color: Colors.yellow),
                        ),
                      ),
                      Text(
                        videoController.icon_name_Map[index]['name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
