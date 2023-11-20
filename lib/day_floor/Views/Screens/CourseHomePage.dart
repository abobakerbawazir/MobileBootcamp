import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/day_floor/Database/db_helper.dart';
import 'package:flutter_application_2/day_floor/Entites/course.dart';
import 'package:flutter_application_2/day_floor/Entites/student.dart';

class CourseHomePage extends StatefulWidget {
  const CourseHomePage({super.key});

  @override
  State<CourseHomePage> createState() => _CourseHomePageState();
}

class _CourseHomePageState extends State<CourseHomePage> {
  TextEditingController nameTxt = TextEditingController();
  TextEditingController hoursTxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () async {
      //     int x = await DBHelper.database.courseDao
      //         .addCourse(Course(name: 'Dart totarial', hours: 20));
      //     print(x);
      //     setState(() {});
      //   },
      // ),
      appBar: AppBar(
        title: Text("Course Home Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Center(
                  child: TextFormField(
                      controller: nameTxt,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Course Name',
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: hoursTxt,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Hours',
                    )),
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () async {
                    setState(() {});
                    Course c = Course(
                        name: nameTxt.text, hours: int.parse(hoursTxt.text));
                    int x = await DBHelper.database.courseDao.addCourse(c);
                    print(x);
                    nameTxt.clear();
                    hoursTxt.clear();
                  },
                  child: Text("Add Course")),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.6,
                child: FutureBuilder(
                  future: DBHelper.database.courseDao.getAllCourses(),
                  builder: (context, AsyncSnapshot<List<Course>> snapshot) {
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
                                                  nameTxt.text = snapshot
                                                      .data![index].name!;
                                                  hoursTxt.text = snapshot
                                                      .data![index].hours!
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
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.3,
                                                                child:
                                                                    TextFormField(
                                                                        controller:
                                                                            nameTxt,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                          hintText:
                                                                              'Student Name',
                                                                        )),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.3,
                                                                child:
                                                                    TextFormField(
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .number,
                                                                        inputFormatters: [
                                                                          FilteringTextInputFormatter
                                                                              .digitsOnly
                                                                        ],
                                                                        controller:
                                                                            hoursTxt,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                          hintText:
                                                                              'Hours',
                                                                        )),
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
                                                                    int? x = await DBHelper.database.courseDao.updatesCourse(Course(
                                                                        id: snapshot
                                                                            .data![
                                                                                index]
                                                                            .id!,
                                                                        name: nameTxt
                                                                            .text,
                                                                        hours: int.parse(
                                                                            hoursTxt.text)));
                                                                    nameTxt
                                                                        .clear();
                                                                    hoursTxt
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
                                            Text(snapshot.data![index].id!
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
                                                            "Do you remove ${snapshot.data![index].name} Course",
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
                                                                    .courseDao
                                                                    .deleteCourse(snapshot
                                                                        .data![
                                                                            index]
                                                                        .id!);
                                                                print(x);
                                                                setState(() {});
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Center(
                                                                child:
                                                                    Text('Yes'),
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
                                        Text(
                                          snapshot.data![index].name!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("${snapshot.data![index].hours}"),
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
          ),
        ),
      ),
    );
  }
}
