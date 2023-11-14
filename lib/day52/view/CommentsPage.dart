import 'package:day_48_exercise/day52/Controller/CommentsController.dart';
import 'package:day_48_exercise/day52/Model/CommentsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommentsPage extends StatefulWidget {
  String name;
  CommentsPage({super.key, required this.name});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<CommentsModel>? commentsModel;
  late CommentsController commentsController = CommentsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: commentsController.getComments(widget.name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              commentsModel = snapshot.data;
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(commentsModel![index].id!),
                      Text(commentsModel![index].content!),
                      Text(commentsModel![index].createdAt!),
                      Text("${commentsModel![index].isActive!}"),
                      Text("${commentsModel![index].blogId!}")
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
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
