import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'dart:math';

import 'package:flutter/services.dart';

Dio dio = Dio();
Future<dynamic> index() async {
  try {
    Response response = await dio.get("path");
  } catch (e) {}
}

Future<dynamic> delete(String id) async {
  try {
    //Response response
  } catch (e) {}
}

class Course {
  late String name, level;
  String? image;
  late int hours;
  late int id;
  Course(
      {required this.name,
      required this.hours,
      required this.level,
      this.image}) {
    id = Random().nextInt(1000) + 1;
  }
}

class CourseController {
  List<Course> courseList = [];
  int selectedIndex = -1;

  void addCourse(String name, int hours, String level, [String? image]) {
    Course newCourse =
        Course(name: name, hours: hours, level: level, image: image);
    courseList.add(newCourse);
  }

  // void deleteCourseAtIndex(int index) {
  //   courseList.removeAt(index);
  // }

  void editTodoAtIndex(int index) {
    selectedIndex = index;
    Course course = courseList[index];
  }

  void updateTodo() {
    if (selectedIndex != -1) {
      Course course = courseList[selectedIndex];
    }
  }
}

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  CourseController courseController = CourseController();
  TextEditingController nameController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  int selectedIndex = -1;
  addCourseView() {
    setState(() {
      courseController.addCourse(
          nameController.text,
          int.parse(hoursController.text),
          levelController.text,
          "assets/images/" + imageController.text + ".jpg");
      nameController.clear();
      hoursController.clear();
      levelController.clear();
      imageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Course Page")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Enter a Name"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: hoursController,
              decoration: InputDecoration(labelText: "Enter a Hours"),
            ),
            TextField(
              controller: levelController,
              decoration: InputDecoration(labelText: "Enter a Level"),
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: "Enter a Image path"),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                  addCourseView();
                },
                child: Text("Add Item")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ViewPageAddCourse',
                      arguments: courseController.courseList);
                },
                child: Text("Veiw List Page"))
          ],
        ),
      ),
    );
  }
}

class ViewPageAddCourse extends StatefulWidget {
  const ViewPageAddCourse({super.key});

  @override
  State<ViewPageAddCourse> createState() => _ViewPageAddCourseState();
}

class _ViewPageAddCourseState extends State<ViewPageAddCourse> {
  String imagePath = "assets/images/";
  List<Course> items = [];
  deletedCourse(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete item : ${items[index].name}"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    items.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                child: Text("Ok, Delete")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"))
          ],
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    items = ModalRoute.of(context)!.settings.arguments as List<Course>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // List<String> x = ["d", "d", "fgd"];
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Page Add Course"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/courseDetailPage',
                        arguments: items[index]);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Image.asset(items[index].image??"assets/images/1.jpg",fit: BoxFit.cover),
                      Text("id : ${items[index].id.toString()}"),
                      Text("${index + 1} ${items[index].name}"),
                      Text(items[index].hours.toString()),
                      Text(items[index].level),
                      Text(items[index].image ?? "${imagePath}1.jpg"),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      deletedCourse(index);
                    },
                    icon: Icon(Icons.delete))
              ],
            );
          },
        ),
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/";
    Course item;
    item = ModalRoute.of(context)!.settings.arguments as Course;
    return Scaffold(
      appBar: AppBar(
        title: Text("CourseDetailPage"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: Image.asset(
                    item.image ?? '${imagePath}1.jpg',
                    fit: BoxFit.cover,
                  )),
              Text("id : ${item.id.toString()}"),
              Text(item.name),
              Text(item.hours.toString()),
              Text(item.level),
              Text(item.image ?? "${imagePath}1.jpg")
            ],
          ),
        ),
      ),
    );
  }
}
