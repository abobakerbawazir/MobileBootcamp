import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:task1_day45/core/repositories/data_repo.dart';
import 'package:task1_day45/core/repositories/online_data.dart';
import 'package:task1_day45/utils/constants/api_routes.dart';

class ModelTodos {
  int? userId;
  bool? completed;
  String? todo;
  int? id;
  //String? title;

  ModelTodos({this.id, this.todo, this.completed, this.userId});
  ModelTodos.fromJson(Map<String, dynamic> row) {
    //title = row["title"];
    id = row["id"];
    todo = row["todo"];
    completed = row["completed"];
    userId = row["userId"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "todo": todo,
      "completed": completed,
      "userId": userId
      //"title": title,
    };
  }
}

class TodosController {
  Future<List<ModelTodos>> loadTodo(DataRepo repo, String source) async {
    Map<String, dynamic> data = await repo.getData(source: source);
    List<dynamic> todos = data["todos"];
    List<ModelTodos> allUsers =
        todos.map((e) => ModelTodos.fromJson(e)).toList();
    return allUsers;
  }

  Future<Map<String, dynamic>> savePost(DataRepo repo, ModelTodos t) async {
    Map<String, dynamic> feedback =
        await repo.postData(t.toJson(), APIRoutes.STORE_Todos);

    return feedback;
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodosController todosController = TodosController();
  GlobalKey<FormState> frmKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TodosController tController = TodosController();
  Future<String?> loadProduct() async {
    try {
      Dio d = Dio();
      Response<String> serverResponse =
          await d.get('https://dummyjson.com/todos');

      print(serverResponse.data);
      return serverResponse.data;
    } catch (e) {
      print(e);
    }
    //serverResponse.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          child: Column(
        children: [
          SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child:  FutureBuilder(future: todosController.loadTodo(OnlineDataRepo(), APIRoutes.STORE_Todos),
        builder: (ctx,snapShot){
          if(snapShot.connectionState==ConnectionState.done){
            if(snapShot.hasData){
              return ListView.builder(itemBuilder:(ctx,index){
                return Card(child: Text(snapShot.data![index].todo!),);
              },itemCount:  snapShot.data!.length);

            }
            else
              return Center(child: Text("NO dta"),);
          }
          else
            return Center(child: CircularProgressIndicator(),);
        },
      ),),
          TextFormField(
            controller: titleController,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("object");
          loadProduct();
          print(APIRoutes.STORE_POST);
          ModelTodos t = ModelTodos(
              id: 1, todo: titleController.text, completed: true, userId: 26);
          Map<String, dynamic> data =
              await tController.savePost(OnlineDataRepo(), t);
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
        child: Container(
            height: 60, width: 200, child: Center(child: Text("Add Todo"))),
      ),
    );
  }
}
