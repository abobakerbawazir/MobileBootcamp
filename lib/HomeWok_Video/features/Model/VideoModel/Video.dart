import 'package:flutter/cupertino.dart';

class Video {
  final String type_Movie;
  final String name;
  final String video_path;
  final String image_path;
  IconData? name_icon;
  IconData? name_icon_color_red;
  bool? isSelectedIcon;

  Video(
      {this.isSelectedIcon,required this.type_Movie,
      required this.name,
      required this.video_path,
      required this.image_path,
      this.name_icon,
      this.name_icon_color_red}) {
    this.isSelectedIcon = false;
  }
}
