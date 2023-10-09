import 'package:flutter/material.dart';


class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 34, 16, 16),
        title: Text('Transfer Center'),
      ),
      body: Center(
        child: Text('Tab 1 Content'),
      ),
    );
  }
}

class Tab2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 34, 16, 16),
        title: Text('Transfer Center'),
      ),
      body: Center(
        child: Text('Tab 2 Content'),
      ),
    );
  }
}

class Tab3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 34, 16, 16),
        title: Text('Transfer Center'),
      ),
      body: Center(
        child: Text('Tab 3 Content'),
      ),
    );
  }
}

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 34, 16, 16),
        title: Text('Transfer Center'),
      ),
      body: Center(
        child: Text('Tab 4 Content'),
      ),
    );
  }
}

class BottomTabBarApp extends StatefulWidget {
  @override
  _BottomTabBarAppState createState() => _BottomTabBarAppState();
}

class _BottomTabBarAppState extends State<BottomTabBarApp> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Tab1Screen(),
    Tab2Screen(),
    Tab3Screen(),
    Tab4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.tab),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_outlined),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_line_spacing_outlined),
              label: 'Leagues',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded),
              label: 'Following',
            ),
          ],
        ),
      ),
    );
  }
}