import 'package:flutter/material.dart';
import 'CorurseModel.dart';
import 'CouresController.dart';
import 'CoursePage.dart';
import 'main.dart';

class CourseMangement extends StatefulWidget {
  CourseMangement({super.key});

  @override
  State<CourseMangement> createState() => _CourseMangementState();
}

class _CourseMangementState extends State<CourseMangement> {
  //List<Course> courseListx = [];

  // CouresController couresController = CouresController();
  TextEditingController nameController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  int selectedIndex = -1;

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

  bool isdark = false;
  @override
  void initState() {
    couresController.courseList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   //courseListx.add(couresController.courseList.last);
    //   couresController.courseList;
    // });
    //couresController.courseList;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: isdark,
            onChanged: (value) {
              isdark = value;
              appTheme.toggleTheme(isdark);
              setState(() {});
            },
          ),
        ],
        title: Text('CourseMangement'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 200,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CoursePage();
                      },
                    ));
                  },
                  child: Text("Add Course",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemCount: couresController.courseList.length,
                      itemBuilder: ((context, index) {
                        final Course course = Course(
                            name: couresController.courseList[index].name,
                            hours: couresController.courseList[index].hours);
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(couresController
                                        .courseList[index].name),
                                    Text(couresController
                                        .courseList[index].hours
                                        .toString()),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    deleteCourseAtIndexView(index);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    editCourseAtIndex(index);
                                    Navigator.pop(context);

                                    // Navigator.push(context, MaterialPageRoute(
                                    //   builder: (context) {
                                    //     return CoursePage();
                                    //   },
                                    // ));
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.check),
                                  onPressed: () {
                                    updateCourse();
                                    Navigator.pop(context);
                                    // Navigator.push(context, MaterialPageRoute(
                                    //   builder: (context) {
                                    //     return CoursePage();
                                    //   },
                                    // ));
                                  },
                                )
                              ],
                            )
                          ],
                        );
                      })))
            ],
          )
        ],
      ),
    );
  }
}
