import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/features/Model/VideoModel/Video.dart';
import 'package:video/HomeWok_Video/features/Veiw/HomeScreen.dart';
import 'package:video/HomeWok_Video/features/Veiw/Home_nav.dart';
import 'package:video/HomeWok_Video/features/Veiw/ListWatch_Video.dart';
import 'package:video/HomeWok_Video/features/Veiw/NotificationPage.dart';
import 'package:video/HomeWok_Video/features/Veiw/WatcList.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 1;
  final List<Widget> secerrns = [
    
    ListWatch_Video(x: [Video(
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
        image_path: 'assets/imagesvideo/movies9.jpg'),]),HomeNav(),Notification_page()
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: secerrns[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(

            //type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,selectedItemColor: Colors.yellow,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "",),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined), label: ""),
             // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person")
            ]));
  }
}