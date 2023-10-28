import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/features/Controller/VideoController/VideoController.dart';
import 'package:video/HomeWok_Video/features/Model/VideoModel/Video.dart';
import 'package:video/HomeWok_Video/features/Veiw/VideoPlayerScreenPage.dart';
import 'package:video/HomeWok_Video/features/Veiw/ListWatch_Video.dart';

class ListViewBuilderHomePage_180_8_2 extends StatefulWidget {
  const ListViewBuilderHomePage_180_8_2({super.key});

  @override
  State<ListViewBuilderHomePage_180_8_2> createState() =>
      _ListViewBuilderHomePage_180_8_2State();
}

class _ListViewBuilderHomePage_180_8_2State
    extends State<ListViewBuilderHomePage_180_8_2> {
  VideoController videoController = VideoController();
  //late final List<Video> videoListToRoute;
  @override
  void initState() {
    //videoListToRoute = videoController.videoSetToRoute.toList();
    //videoController.videoListToRoute;
    videoController.videoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 65, 64, 64),
      child: SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videoController.videoList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreenPage(
                                videoController.videoList[index].video_path),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(videoController
                                      .videoList[index].image_path),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                                left: 5, top: 10, bottom: 10, right: 5),
                          ),
                          Positioned(
                              left: 10,
                              top: 25,
                              child: SizedBox(
                                  height: 25,
                                  width: 35,
                                  child: Image.asset("assets/images/HD.png"))),
                          Positioned(
                              right: 17,
                              top: 25,
                              child: SizedBox(
                                  height: 25,
                                  width: 35,
                                  child:
                                      Image.asset("assets/images/star1.png"))),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {});
                          //setState(() {});
                          videoController.AddVideoTovideoListToRoute(
                              videoController.videoList[index].name,
                              videoController.videoList[index].video_path,
                              videoController.videoList[index].image_path,
                              videoController.videoList[index].type_Movie);

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ListWatch_Video(
                                  x: videoController.videoListToRoute);
                            },
                          ));
                          //Navigator.pushNamed(context, '/aaa',arguments: videoController.videoList);
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                videoController.videoList[index].name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                videoController.videoList[index].type_Movie,
                                style: const TextStyle(
                                    color: Colors.yellow, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {});
                            if (videoController
                                    .videoList[index].isSelectedIcon ==
                                false) {
                              videoController.videoList[index].isSelectedIcon =
                                  true;
                            } else {
                              videoController.videoList[index].isSelectedIcon =
                                  false;
                            }
                          },
                          child: videoController
                                      .videoList[index].isSelectedIcon ==
                                  false
                              ? Icon(
                                  videoController.videoList[index].name_icon,
                                  color: Colors.yellowAccent,
                                )
                              : Icon(
                                  color: Colors.red,
                                  videoController
                                      .videoList[index].name_icon_color_red)),
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }
}
