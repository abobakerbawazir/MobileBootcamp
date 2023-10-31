import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Post1 {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  Owner? owner;

  Post1(
      {this.id,
      this.image,
      this.likes,
      this.tags,
      this.text,
      this.publishDate,
      this.owner});

  Post1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    likes = json['likes'];
    tags = json['tags'].cast<String>();
    text = json['text'];
    publishDate = json['publishDate'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['tags'] = this.tags;
    data['text'] = this.text;
    data['publishDate'] = this.publishDate;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class Owner {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Owner({this.id, this.title, this.firstName, this.lastName, this.picture});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['picture'] = this.picture;
    return data;
  }
}

class ScreenDio11 extends StatefulWidget {
  const ScreenDio11({super.key});

  @override
  State<ScreenDio11> createState() => _ScreenDio11State();
}

class _ScreenDio11State extends State<ScreenDio11> {
  Future<String?> loadProduct() async {
    Dio d = Dio();
    final serverResponse = await d.get(
        "https://dummyapi.io/data/v1/post?limit=10",
        options: Options(headers: {"app-id": "653f57ce0d18c558626e3884"}));

    print(serverResponse.data);
    return serverResponse.data;
    //serverResponse.data;
  }

  @override
  void initState() {
    loadProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: loadProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                Map<String, dynamic> content = jsonDecode(snapshot.data!);
                List<dynamic> owner = content['owner'];
                return ListView.builder(
                  itemCount: owner.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                         Text(owner[index]['id'])
                          // Card(
                          //   child: Image.network(owner[index]['thumbnail']),
                          // ),
                          //Image.network(product[index]['images'][0]),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    children: [
                      //Divider(),Spacer(),
                      Text("No Data avilable"),
                    ],
                  ),
                );
              }
            }
            return Text("data");
          },
        )
        // Column(
        //   children: [
        //     SizedBox(
        //       height: 20,
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           loadProduct();
        //         },
        //         child: Text("API"))
        //   ],
        // ),
        );
  }
}
