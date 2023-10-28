import 'package:flutter/material.dart';
import 'package:video/HomeWok_Video/features/Controller/VideoController/VideoController.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreenPage extends StatefulWidget {
  final String video_path;

  const VideoPlayerScreenPage(this.video_path);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreenPage> {
  
  VideoController videoController = VideoController();
  late VideoPlayerController _videoController;

  @override
  void initState() {
    //videoController.icon_name_Map;
    videoController.videoList;
    super.initState();
    _videoController = VideoPlayerController.asset(widget.video_path)
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 48, 48),
        title: const Text(
          'watching',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 180,
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
                                builder: (context) => VideoPlayerScreenPage(
                                    videoController
                                        .videoList[index].video_path),
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 120,
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
                        ),
                      );
                    },
                  )),
            ),
          ),
          Container(
            color: Colors.black,
            height: 10,
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 180,
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
                                builder: (context) => VideoPlayerScreenPage(
                                    videoController
                                        .videoList[index].video_path),
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 120,
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
                        ),
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
/* @override
  Widget build(BuildContext context) {
    if (_videoController.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
           backgroundColor: Color.fromARGB(255, 49, 48, 48),
          title: Text('watching',style: TextStyle(color: Colors.white),),
        ),
       
        
        body: Column(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Watching'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
} */