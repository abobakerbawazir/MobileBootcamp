import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvc_flutter/Exerciseday42/Controller/PostController.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late PostController _postController;
  @override
  void initState() {
    _postController = PostController();
    //_postController.fatchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise"),
      ),
      body: FutureBuilder(
        future: _postController.fatchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: _postController.allPosts.length,
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
                              Text("${_postController.allPosts[index].title}"),
                          subtitle:
                              Text("${_postController.allPosts[index].body}"),
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
            } else {
              return Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
