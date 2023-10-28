import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/features/Veiw/HomeScreen.dart';
import 'package:video/HomeWok_Video/features/Veiw/NotificationPage.dart';
import 'package:video/HomeWok_Video/features/Veiw/WatcList.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> secerrns = [
    
    WatchListPage(),HomeScreen(),Notification_page()
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: secerrns[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            //type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined), label: ""),
             // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person")
            ]));
  }
}