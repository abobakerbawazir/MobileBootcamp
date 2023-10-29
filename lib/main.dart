import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_flutter/Exerciseday42/Model/PostModel.dart';
import 'package:mvc_flutter/Exerciseday42/View/Screen1.dart';
import 'package:mvc_flutter/View/Home.dart';

void main() {
  runApp(const MyApp());
}

cgetfileContent() async {
  String content = await rootBundle.loadString("assets/post.json");
  List<Post> li =
      (json.decode(content) as List).map((e) => Post.fromJson(e)).toList();
  print(li);
  return li;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen1(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class CarePage extends StatefulWidget {
  const CarePage({super.key});

  @override
  State<CarePage> createState() => _CarePageState();
}

class _CarePageState extends State<CarePage> {
  List<Map<String, dynamic>> listCart = [
    {"id": 1, "name": "Ali", "price": 30},
    {"id": 2, "name": "Ali11", "price": 400},
    {"id": 3, "name": "Ali", "price": 30}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: listCart.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${listCart[index]['id']}"),
                      Text(listCart[index]['name']),
                      Text("${listCart[index]['price']}")
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
