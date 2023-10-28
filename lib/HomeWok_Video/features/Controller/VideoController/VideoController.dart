import 'package:flutter/material.dart';
import 'package:video/HomeWok_Video/features/Model/VideoModel/Video.dart';

class VideoController {
  Set<Video> videoSetToRoute = Set<Video>();
  late List<Video> videoListToRoute;
  VideoController() {
    videoListToRoute = videoSetToRoute.toList();
  }
  getlist() {
    videoListToRoute = videoSetToRoute.toList();
    return videoListToRoute;
  }

//late Video video;
  final List<Video> videoList = [
    Video(
        type_Movie: "Movie",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video1',
        video_path: 'assets/videos/1.mp4',
        image_path: 'assets/imagesvideo/movies1.jpg'),
    Video(
        type_Movie: "Series",
        name_icon: Icons.favorite_border,
        name_icon_color_red: Icons.favorite,
        name: 'video2',
        video_path: 'assets/videos/2.mp4',
        image_path: 'assets/imagesvideo/movies2.jpg'),
    Video(
        type_Movie: "Harrar",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video3',
        video_path: 'assets/videos/3.mp4',
        image_path: 'assets/imagesvideo/movies3.jpg'),
    Video(
        type_Movie: "Romaribo",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video4',
        video_path: 'assets/videos/4.mp4',
        image_path: 'assets/imagesvideo/movies4.jpg'),
    Video(
        type_Movie: "Action",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video5',
        video_path: 'assets/videos/5.mp4',
        image_path: 'assets/imagesvideo/movies5.jpg'),
    Video(
        type_Movie: "kids Ccntent",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video6',
        video_path: 'assets/videos/6.mp4',
        image_path: 'assets/imagesvideo/movies6.jpg'),
    Video(
        type_Movie: "Drama",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video7',
        video_path: 'assets/videos/7.mp4',
        image_path: 'assets/imagesvideo/movies7.jpg'),
    Video(
        type_Movie: "Series",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video8',
        video_path: 'assets/videos/8.mp4',
        image_path: 'assets/imagesvideo/movies8.jpg'),
    Video(
        type_Movie: "Movie",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video9',
        video_path: 'assets/videos/9.mp4',
        image_path: 'assets/imagesvideo/movies9.jpg'),
    Video(
        type_Movie: "Romaribo",
        name_icon_color_red: Icons.favorite,
        name_icon: Icons.favorite_border,
        name: 'video10',
        video_path: 'assets/videos/10.mp4',
        image_path: 'assets/imagesvideo/movies10.jpg'),
  ];
  List<Map<String, dynamic>> icon_name_Map = [
    {"icon": Icons.movie, "name": "MOVIE"},
    {"icon": Icons.add, "name": "SERIES"},
    {"icon": Icons.content_copy, "name": "kIDS CONTENT"},
    {"icon": Icons.abc, "name": "MOVIE"},
    {"icon": Icons.remove, "name": "ACTION"},
    {"icon": Icons.outbond, "name": "DRAMA"},
  ];
  void AddVideoTovideoListToRoute(
      String name, String video_path, String image_path, String type_Movie) {
    // if(!videoListToRoute.any((element) => element.name==video.name)){};
    Video newVideo = Video(
        name: name,
        video_path: video_path,
        image_path: image_path,
        type_Movie: type_Movie);
    videoListToRoute.add(newVideo);

    //  videoListToRoute = videoSetToRoute.toList();
    // return videoListToRoute;
  }

  void deleteVideoTovideoListToRoute(int index) {
    videoListToRoute.removeAt(index);
  }
}
