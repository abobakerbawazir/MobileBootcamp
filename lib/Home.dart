// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class Video {
//   final String name;
//   final String video_path;
//   final String image_path;

//   Video({required this.name,required this.video_path,required this.image_path});
// }

// class MyAppp extends StatelessWidget {
//   final List<Video> videoList = [
//     Video(name: 'video1', video_path: 'assets/videos/1.mp4', image_path: 'assets/images/1.jpg'),
//     Video(name: 'video2', video_path: 'assets/videos/2.mp4', image_path: 'assets/images/2.jpg'),
//     Video(name: 'video3', video_path: 'assets/videos/3.mp4', image_path: 'assets/images/3.jpg'),
//     Video(name: 'video4', video_path: 'assets/videos/4.mp4', image_path: 'assets/images/4.jpg'),
//     Video(name: 'video5', video_path: 'assets/videos/5.mp4', image_path: 'assets/images/5.jpg'),
    
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'قائمة الفيديوهات',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('قائمة الفيديوهات'),
//         ),
//         body: ListView.builder(
//           itemCount: videoList.length,
//           itemBuilder: (context, index) {
//             final video = videoList[index];
//             return ListTile(
//               leading: Image.asset(
//                 video.image_path,
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.cover,
//               ),
//               title: Text(video.name),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => VideoPlayerScreen(video.video_path),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class VideoPlayerScreen extends StatefulWidget {
//   final String video_path;

//   VideoPlayerScreen(this.video_path);

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _videoController;

//   @override
//   void initState() {
//     super.initState();
//     _videoController = VideoPlayerController.asset(widget.video_path)
//       ..initialize().then((_) {
//         setState(() {});
//         _videoController.play();
//       });
//   }

//   @override
//   void dispose() {
//     _videoController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_videoController.value.isInitialized) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('تشغيل الفيديو'),
//         ),
//         body: Center(
//           child: AspectRatio(
//             aspectRatio: _videoController.value.aspectRatio,
//             child: VideoPlayer(_videoController),
//           ),
//         ),
//       );
//     } else {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('تشغيل الفيديو'),
//         ),
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//   }
// }
