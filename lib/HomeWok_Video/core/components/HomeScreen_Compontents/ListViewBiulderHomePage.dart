import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/features/Controller/VideoController/VideoController.dart';
import 'package:video/HomeWok_Video/features/Veiw/VideoPlayerScreenPage.dart';

class ListViewBiulderHomePage extends StatefulWidget {
  const ListViewBiulderHomePage({super.key});

  @override
  State<ListViewBiulderHomePage> createState() =>
      _ListViewBiulderHomePageState();
}

class _ListViewBiulderHomePageState extends State<ListViewBiulderHomePage> {
  VideoController videoController = VideoController();
  @override
  void initState() {
    videoController.videoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 65, 64, 64),
      child: SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videoController.videoList.length,
            itemBuilder: (context, index) {
              return Container(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoPlayerScreenPage(videoController.videoList[index].video_path),
                      ),
                    );
                  },
                  child: Container(
                    width: 220,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(videoController.videoList[index].image_path),
                          fit: BoxFit.cover),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        left: 5, top: 10, bottom: 10, right: 5),
                  ),
                ),
              );
            },
          )),
    );
  }
}
