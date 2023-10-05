import 'package:flutter/material.dart';

import 'routeManger.dart';
void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      onGenerateRoute: Routemanager.generateRoute,
      
    );
  }
}
