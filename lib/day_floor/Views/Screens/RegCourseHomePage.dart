import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/day_floor/Database/db_helper.dart';
import 'package:flutter_application_2/day_floor/Entites/RegStudent.dart';
import 'package:flutter_application_2/day_floor/Entites/course.dart';
import 'package:flutter_application_2/day_floor/Entites/student.dart';

class RegCourseHomePage extends StatefulWidget {
  const RegCourseHomePage({super.key});

  @override
  State<RegCourseHomePage> createState() => _RegCourseHomePageState();
}

class _RegCourseHomePageState extends State<RegCourseHomePage> {
  TextEditingController studentIdTxt = TextEditingController();
  TextEditingController courseIdTxt = TextEditingController();
  int? typeCourse;
  int? typeStudent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () async {
      //     int x = await DBHelper.database.regCourseDao
      //         .addRegCourse(RegCourse(StudentId: 2, CourseId: 4));
      //     print(x);
      //     setState(() {});
      //   },
      // ),
      appBar: AppBar(
        title: Text("Register Course Home Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        child: FutureBuilder(
                          future: DBHelper.database.courseDao.getAllCourses(),
                          builder:
                              (context, AsyncSnapshot<List<Course>> snapshot) {
                            if (snapshot.hasData) {
                              return snapshot.data!.isEmpty
                                  ? Center(child: Text("Courses are Empty"))
                                  : Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color.fromARGB(
                                              255, 198, 193, 191)),
                                      child: DropdownButton(
                                        value: typeCourse,
                                        items: snapshot.data!.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              item.name.toString(),
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            value: item.id,
                                          );
                                        }).toList(),
                                        onChanged: (newvalue) {
                                          typeCourse = newvalue!;
                                          courseIdTxt.text =
                                              typeCourse!.toString();

                                          setState(() {});
                                        },
                                      ),
                                    );
                            } else {
                              return Text("data is no");
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Card(
                            color: Colors.amber,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              controller: courseIdTxt,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        child: FutureBuilder(
                          future: DBHelper.database.studentDao.getAllStudents(),
                          builder:
                              (context, AsyncSnapshot<List<Student>> snapshot) {
                            if (snapshot.hasData) {
                              return snapshot.data!.isEmpty
                                  ? Center(child: Text("Student are Empty"))
                                  : Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color.fromARGB(
                                              255, 198, 193, 191)),
                                      child: DropdownButton(
                                        value: typeStudent,
                                        items: snapshot.data!.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              item.name.toString(),
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            value: item.id,
                                          );
                                        }).toList(),
                                        onChanged: (newvalue) {
                                          typeStudent = newvalue!;
                                          studentIdTxt.text =
                                              typeStudent!.toString();

                                          setState(() {});
                                        },
                                      ),
                                    );
                            } else {
                              return Text("data is no");
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Card(
                            color: Colors.amber,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              controller: studentIdTxt,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    onPressed: () async {
                      setState(() {});
                      RegCourse r = RegCourse(
                          StudentId: int.parse(studentIdTxt.text),
                          CourseId: int.parse(courseIdTxt.text));
                      int x =
                          await DBHelper.database.regCourseDao.addRegCourse(r);
                      print(x);
                      studentIdTxt.clear();
                      courseIdTxt.clear();
                    },
                    child: Text("Add Register course of Student")),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: FutureBuilder(
                    future: DBHelper.database.regCourseDao.getAllRegCourses(),
                    builder:
                        (context, AsyncSnapshot<List<RegCourse>> snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!.isEmpty
                            ? Center(child: Text("Empty "))
                            : ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    child: Card(
                                      color: index.isEven
                                          ? Colors.amber
                                          : Colors.pink,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                  onPressed: () async {
                                                    studentIdTxt.text = snapshot
                                                        .data![index].StudentId!
                                                        .toString();
                                                    courseIdTxt.text = snapshot
                                                        .data![index].CourseId!
                                                        .toString();
                                                    bool? v =
                                                        await showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return SizedBox(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    15),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          SizedBox(
                                                                        child:
                                                                            FutureBuilder(
                                                                          future: DBHelper
                                                                              .database
                                                                              .courseDao
                                                                              .getAllCourses(),
                                                                          builder:
                                                                              (context, AsyncSnapshot<List<Course>> snapshot) {
                                                                            if (snapshot.hasData) {
                                                                              return snapshot.data!.isEmpty
                                                                                  ? Center(child: Text("Courses are Empty"))
                                                                                  : Container(
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 198, 193, 191)),
                                                                                      child: DropdownButton(
                                                                                        value: typeCourse,
                                                                                        items: snapshot.data!.map((item) {
                                                                                          return DropdownMenuItem(
                                                                                            child: Text(
                                                                                              item.name.toString(),
                                                                                              style: TextStyle(color: Colors.black),
                                                                                            ),
                                                                                            value: item.id,
                                                                                          );
                                                                                        }).toList(),
                                                                                        onChanged: (newvalue) {
                                                                                          typeCourse = newvalue!;
                                                                                          courseIdTxt.text = typeCourse!.toString();

                                                                                          setState(() {});
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                            } else {
                                                                              return Text("data is no");
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                3,
                                                                        child: Card(
                                                                            color: Colors.amber,
                                                                            child: TextFormField(
                                                                              textAlign: TextAlign.center,
                                                                              readOnly: true,
                                                                              controller: courseIdTxt,
                                                                              decoration: InputDecoration(border: InputBorder.none),
                                                                            )),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          SizedBox(
                                                                        child:
                                                                            FutureBuilder(
                                                                          future: DBHelper
                                                                              .database
                                                                              .studentDao
                                                                              .getAllStudents(),
                                                                          builder:
                                                                              (context, AsyncSnapshot<List<Student>> snapshot) {
                                                                            if (snapshot.hasData) {
                                                                              return snapshot.data!.isEmpty
                                                                                  ? Center(child: Text("Student are Empty"))
                                                                                  : Container(
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 198, 193, 191)),
                                                                                      child: DropdownButton(
                                                                                        value: typeStudent,
                                                                                        items: snapshot.data!.map((item) {
                                                                                          return DropdownMenuItem(
                                                                                            child: Text(
                                                                                              item.name.toString(),
                                                                                              style: TextStyle(color: Colors.black),
                                                                                            ),
                                                                                            value: item.id,
                                                                                          );
                                                                                        }).toList(),
                                                                                        onChanged: (newvalue) {
                                                                                          typeStudent = newvalue!;
                                                                                          studentIdTxt.text = typeStudent!.toString();

                                                                                          setState(() {});
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                            } else {
                                                                              return Text("data is no");
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                3,
                                                                        child: Card(
                                                                            color: Colors.amber,
                                                                            child: TextFormField(
                                                                              textAlign: TextAlign.center,
                                                                              readOnly: true,
                                                                              controller: studentIdTxt,
                                                                              decoration: InputDecoration(border: InputBorder.none),
                                                                            )),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .purple),
                                                                    onPressed:
                                                                        () async {
                                                                      int? x = await DBHelper
                                                                          .database
                                                                          .regCourseDao
                                                                          .updatesRegCourse(
                                                                              RegCourse(
                                                                        StudentId:
                                                                            int.parse(studentIdTxt.text),
                                                                        CourseId:
                                                                            int.parse(courseIdTxt.text),
                                                                      ));
                                                                      studentIdTxt
                                                                          .clear();
                                                                      courseIdTxt
                                                                          .clear();
                                                                      print(x);

                                                                      Navigator.pop(
                                                                          context,
                                                                          true);
                                                                    },
                                                                    child: Text(
                                                                        "Update New"))
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    setState(() {});
                                                    if (v != null && v) {
                                                      setState(() {});
                                                    }
                                                    print(v);
                                                  },
                                                  icon: Icon(Icons.edit)),
                                              Text(snapshot
                                                  .data![index].StudentId!
                                                  .toString()),
                                              Text(snapshot
                                                  .data![index].CourseId!
                                                  .toString()),
                                              IconButton(
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          content: Card(
                                                            color: Colors.amber,
                                                            child: Text(
                                                              "Do you remove ${snapshot.data![index].StudentId} StudentId and ${snapshot.data![index].CourseId} CourseId for Student",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          actions: [
                                                            ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .green),
                                                                onPressed:
                                                                    () async {
                                                                  int? x = await DBHelper
                                                                      .database
                                                                      .regCourseDao
                                                                      .deleteRegCourse(snapshot
                                                                          .data![
                                                                              index]
                                                                          .StudentId!);
                                                                  print(x);
                                                                  setState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                      'Yes'),
                                                                )),
                                                            ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .red),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'No')))
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon: Icon(Icons.delete)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                      } else {
                        return Text("data is no");
                      }
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
