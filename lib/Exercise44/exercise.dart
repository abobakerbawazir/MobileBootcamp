import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:mvc_flutter/main.dart';

class Post {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  Owner? owner;

  Post(
      {this.id,
      this.image,
      this.likes,
      this.tags,
      this.text,
      this.publishDate,
      this.owner});

  Post.fromJson(Map<String, dynamic> json) {
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

//class Controller
class PostController {
  late Post post;
  late List<Post> allPosts;
  Future<List<Post>> fatchPosts() async {
     await Future.delayed(Duration(seconds: 5));

    allPosts = await cgetfileContent();
    print(allPosts);
    return allPosts;
    //return null;
  }
}



//View
class PostViewExercise_day_44 extends StatefulWidget {
  const PostViewExercise_day_44({super.key});

  @override
  State<PostViewExercise_day_44> createState() =>
      _PostViewExercise_day_44State();
}

class _PostViewExercise_day_44State extends State<PostViewExercise_day_44> {
  late PostController pController;
  @override
  void initState() {
    pController = PostController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body:  FutureBuilder(
        future: pController.fatchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: pController.allPosts.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 193, 193, 193),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text("Post ${index + 1}"))),
                        ListTile(
                          title:
                              Text("${pController.allPosts[index].id}"),
                          subtitle:
                              Text("${pController.allPosts[index].likes}"),
                        ),
                        Container(
                          height: 1,
                          color: Color.fromARGB(255, 165, 163, 163),
                        )
                      ],
                    ),
                  );
                },
              );
             } 
             else {
              return Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),);
  }
}
