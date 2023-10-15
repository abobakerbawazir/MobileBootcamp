import 'package:flutter/material.dart';
import 'package:video/RouteManager.dart';
import 'package:video_player/video_player.dart';

import 'Home.dart';
import 'HomeScrrens.dart';
import 'a.dart';
import 'b.dart';
import 'c.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}

