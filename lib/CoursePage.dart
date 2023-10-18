import 'package:exercise_day_36/CourseMangement.dart';
import 'package:exercise_day_36/widgets/App_textfieldfrom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CorurseModel.dart';
import 'CouresController.dart';
import 'main.dart';
//defiend Object global of project
//CouresController couresController = CouresController();

class CoursePage extends StatefulWidget {
  CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  GlobalKey<FormState> Course_key = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  int selectedIndex = -1;

  addCourseView() {
    setState(() {
      couresController.addCourse(
          nameController.text, int.parse(hoursController.text));
      nameController.clear();
      hoursController.clear();
    });
  }

  deleteCourseAtIndexView(int index) {
    setState(() {
      couresController.deleteCourseAtIndex(index);
    });
  }

  void editCourseAtIndex(int index) {
    setState(() {
      selectedIndex = index;
      //defiend varaible Todo=todos[index]
      Course course = couresController.courseList[index];
      nameController.text = course.name;
      hoursController.text = course.hours.toString();
    });
  }

  void updateCourse() {
    if (selectedIndex != -1) {
      String newName = nameController.text;
      int newHours = int.parse(hoursController.text);

      setState(() {
        Course course = couresController.courseList[selectedIndex];
        course.name = newName;
        course.hours = newHours;

        nameController.clear();
        hoursController.clear();
        selectedIndex = -1;
      });
    }
  }

  @override
  void initState() {
    couresController.courseList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course List'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: Course_key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: hoursController,
                decoration: const InputDecoration(
                  labelText: 'Hours',
                ),
              ),
              // My_textformFiled(x: "f",inputFormatterss: [FilteringTextInputFormatter.digitsOnly],),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  addCourseView();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CourseMangement();
                    },
                  ));
                },
                child: Text('Add Course'),
              ),
              SizedBox(
                  height: 300,
                  // child: ListView.builder(
                  //     itemCount: couresController.courseList.length,
                  //     itemBuilder: ((context, index) {
                  //       // final Course course = Course(
                  //       //     name: couresController.courseList[index].name,
                  //       //     hours: couresController.courseList[index].hours);
                  //       return Column(
                  //         children: [
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Column(
                  //                 children: [
                  //                   Text(couresController
                  //                       .courseList[index].name),
                  //                   Text(couresController
                  //                       .courseList[index].hours
                  //                       .toString()),
                  //                 ],
                  //               ),
                  //               IconButton(
                  //                 icon: Icon(Icons.delete),
                  //                 onPressed: () {
                  //                   deleteCourseAtIndexView(index);
                  //                 },
                  //               ),
                  //               IconButton(
                  //                 icon: Icon(Icons.edit),
                  //                 onPressed: () {
                  //                   editCourseAtIndex(index);
                  //                 },
                  //               ),IconButton(
                  //                 icon: Icon(Icons.check),
                  //                 onPressed: () {
                  //                   updateCourse();
                  //                 },
                  //               )
                                
                  //             ],
                  //           )
                  //         ],
                  //       );
                  //     }))
                      )
            ],
          ),
        ),
      ),
    );
  }
}
