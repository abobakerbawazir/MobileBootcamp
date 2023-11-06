import 'package:day_48_exercise/featears/Controller/ControllerDepartments.dart';
import 'package:day_48_exercise/featears/Model/DepartmentModel.dart';
import 'package:day_48_exercise/featears/View/AddDepartmentPage.dart';
import 'package:day_48_exercise/repository/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ControllerDepartment controllerDepartment = ControllerDepartment();
  List<ModelDepartMent>? listsDep = [];
  @override
  void initState() {
    // listsDep = widget.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Departments"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: FutureBuilder(
              future: controllerDepartment.loadDepartments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    listsDep = snapshot.data;
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [Text(listsDep![index].name!)],
                        );
                      },
                    );
                  } else {
                    return Container(
                      color: Colors.blue,
                      width: 200,
                      height: 200,
                    );
                  }
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          Center(
            child: Text("Empty"),
          ),
        ],
      ),
      bottomSheet: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              "/AddDepartmentPage",
            );
          },
          child: Text("Add"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
          )),
    );
  }
}
