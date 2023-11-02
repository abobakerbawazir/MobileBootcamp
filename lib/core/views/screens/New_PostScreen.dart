// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task1_day45/core/repositories/data_repo.dart';
import 'package:task1_day45/core/repositories/online_data.dart';
import 'package:task1_day45/utils/constants/api_routes.dart';

class AddNewPostScreen extends StatefulWidget {
  const AddNewPostScreen({Key? key}) : super(key: key);

  @override
  State<AddNewPostScreen> createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {
  Future<String?> loadProduct() async {
    Dio d = Dio();
    Response<String> serverResponse =
        await d.get("https://dummyjson.com/todos");

    print(serverResponse.data);
    return serverResponse.data;
    //serverResponse.data;
  }

  GlobalKey<FormState> frmKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  New_PostController postsController = New_PostController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
            ),
            TextFormField(
              controller: bodyController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          loadProduct();
          print(APIRoutes.STORE_POST);
          ModelNew_Post p = ModelNew_Post(
              title: titleController.text, body: bodyController.text);
          Map<String, dynamic> data =
              await postsController.savePost(OnlineDataRepo(), p);
          String message = "";
          if (data["id"] == -1)
            message = "فشلت عملية الاضافة";
          else
            message = "تمت الاضافة بنجاح";

          showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text("الحالة"),
                  content: Text(message),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class New_PostController {
  Future<Map<String, dynamic>> savePost(DataRepo repo, ModelNew_Post p) async {
    Map<String, dynamic> feedback =
        await repo.postData(p.toJson(), APIRoutes.STORE_POST);

    return feedback;
  }
}

class ModelNew_Post {
  String? title;
  String? body;
  ModelNew_Post({this.title, this.body});
  ModelNew_Post.fromJson(Map<String, dynamic> row) {
    title = row["title"];
    body = row["body"];
  }

  Map<String, dynamic> toJson() {
    return {"title": title, "body": body};
  }
}
