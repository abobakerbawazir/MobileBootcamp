import 'package:flutter/material.dart';
import 'package:video/HomeScrrens.dart';
import 'package:video/a.dart';
import 'package:video_player/video_player.dart';
class Video {
  final String name;
  final String video_path;
  final String image_path;

  Video(
      {required this.name, required this.video_path, required this.image_path});
}
class VideoPlayerScreenPage extends StatefulWidget {
  final String video_path;

  VideoPlayerScreenPage(this.video_path);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreenPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
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
List<Map<String, dynamic>> icon_name_builder = [
    {"icon": Icons.movie, "name": "MOVIE"},
    {"icon": Icons.abc, "name": "SERIES"},
    {"icon": Icons.content_copy, "name": "kIDS CONTENT"},
    {"icon": Icons.abc, "name": "MOVIE"},
    {"icon": Icons.abc, "name": "asd"},
    {"icon": Icons.abc, "name": "vbgf"},
  ];
  final List<Video> videoList = [
    Video(
        name: 'video1',
        video_path: 'assets/videos/1.mp4',
        image_path: 'assets/images/1.jpg'),
    Video(
        name: 'video2',
        video_path: 'assets/videos/2.mp4',
        image_path: 'assets/images/2.jpg'),
    Video(
        name: 'video3',
        video_path: 'assets/videos/3.mp4',
        image_path: 'assets/images/3.jpg'),
    Video(
        name: 'video4',
        video_path: 'assets/videos/4.mp4',
        image_path: 'assets/images/4.jpg'),
    Video(
        name: 'video5',
        video_path: 'assets/videos/5.mp4',
        image_path: 'assets/images/5.jpg'),
    Video(
        name: 'video5',
        video_path: 'assets/videos/6.mp4',
        image_path: 'assets/images/6.jpg'),
    Video(
        name: 'video5',
        video_path: 'assets/videos/7.mp4',
        image_path: 'assets/images/7.jpg'),
    Video(
        name: 'video5',
        video_path: 'assets/videos/8.mp4',
        image_path: 'assets/images/8.jpg'),
    Video(
        name: 'video5',
        video_path: 'assets/videos/9.mp4',
        image_path: 'assets/images/9.jpg'),
    Video(
        name: 'video5',
        video_path: 'assets/videos/10.mp4',
        image_path: 'assets/images/10.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 48, 48),
        title: Text(
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
              color: Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videoList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPlayerScreenPage(
                                    videoList[index].video_path),
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(videoList[index].image_path),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(
                                left: 5, top: 10, bottom: 10, right: 5),
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ),
          Container(color: Colors.black,height: 10,),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 65, 64, 64),
              child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videoList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPlayerScreenPage(
                                    videoList[index].video_path),
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(videoList[index].image_path),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(
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