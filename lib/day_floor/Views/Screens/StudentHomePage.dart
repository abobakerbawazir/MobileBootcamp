import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/day_floor/Database/db_helper.dart';
import 'package:flutter_application_2/day_floor/Entites/department.dart';
import 'package:flutter_application_2/day_floor/Entites/student.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  // var listitems = ["Increase", "Descrise"];
  int? type;
  TextEditingController nameTxt = TextEditingController();
  TextEditingController phoneNoTxt = TextEditingController();
  TextEditingController emailTxt = TextEditingController();
  TextEditingController departmentIdTxt = TextEditingController();

  // int? id,
  // String? name,
  // String? phoneNo,
  // String? email,
  // bool? active,
  // int? departmentId,
  // bool isSelected = false,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          int x = await DBHelper.database.studentDao.addStudent(Student(
              name: 'ahmed',
              email: 'Ahmed@gmail.com',
              phoneNo: '775630183',
              departmentId: 1,
              active: true));
          print(x);
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text("StudentHomePage"),
      ),
      body: SingleChildScrollView(
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
                      hintText: 'Student Name',
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                  controller: emailTxt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Student Email',
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                  controller: phoneNoTxt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Student Phone',
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    child: FutureBuilder(
                      future:
                          DBHelper.database.departmentDao.getAllDepartments(),
                      builder:
                          (context, AsyncSnapshot<List<Department>> snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isEmpty
                              ? Center(child: Text("Departments are Empty"))
                              : Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 198, 193, 191)),
                                  child: DropdownButton(
                                    value: type,
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
                                      type = newvalue!;
                                      departmentIdTxt.text = type!.toString();

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
                    width: MediaQuery.of(context).size.width / 6,
                    child: Card(
                        color: Colors.amber,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          controller: departmentIdTxt,
                          decoration: InputDecoration(border: InputBorder.none),
                        )),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () async {
                  setState(() {});
                  Student s = Student(
                      name: nameTxt.text,
                      email: emailTxt.text,
                      phoneNo: phoneNoTxt.text,
                      departmentId: int.parse(departmentIdTxt.text),
                      active: true);
                  int x = await DBHelper.database.studentDao.addStudent(s);
                  print(x);
                  nameTxt.clear();
                  emailTxt.clear();
                  phoneNoTxt.clear();
                  departmentIdTxt.clear();
                },
                child: Text("Add Student")),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.8,
              child: FutureBuilder(
                future: DBHelper.database.studentDao.getAllStudents(),
                builder: (context, AsyncSnapshot<List<Student>> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.isEmpty
                        ? Center(child: Text("Empty "))
                        : ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              int x = snapshot.data![index].departmentId!;
                              return Container(
                                padding: EdgeInsets.all(10),
                                child: Card(
                                  color:
                                      index.isEven ? Colors.amber : Colors.pink,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                nameTxt.text =
                                                    snapshot.data![index].name!;
                                                emailTxt.text = snapshot
                                                    .data![index].email!;
                                                phoneNoTxt.text = snapshot
                                                    .data![index].phoneNo!;
                                                departmentIdTxt.text = snapshot
                                                    .data![index].departmentId!
                                                    .toString();
                                                bool? v =
                                                    await showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return SizedBox(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(15),
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
                                                                        border: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
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
                                                                      controller:
                                                                          emailTxt,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                        hintText:
                                                                            'Student Email',
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
                                                                      controller:
                                                                          phoneNoTxt,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                        hintText:
                                                                            'Student Phone',
                                                                      )),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  10,
                                                              child:
                                                                  FutureBuilder(
                                                                future: DBHelper
                                                                    .database
                                                                    .departmentDao
                                                                    .getAllDepartments(),
                                                                builder: (context,
                                                                    AsyncSnapshot<
                                                                            List<Department>>
                                                                        snapshot) {
                                                                  if (snapshot
                                                                      .hasData) {
                                                                    return snapshot
                                                                            .data!
                                                                            .isEmpty
                                                                        ? Center(
                                                                            child:
                                                                                Text("Departments are Empty"))
                                                                        : DropdownButton(
                                                                            value:
                                                                                type,
                                                                            items:
                                                                                snapshot.data!.map((item) {
                                                                              return DropdownMenuItem(
                                                                                child: Text(item.name.toString()),
                                                                                value: item.id,
                                                                              );
                                                                            }).toList(),
                                                                            onChanged:
                                                                                (newvalue) {
                                                                              type = newvalue!;
                                                                              departmentIdTxt.text = type!.toString();

                                                                              setState(() {});
                                                                            },
                                                                          );
                                                                  } else {
                                                                    return Text(
                                                                        "data is no");
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.3,
                                                              child:
                                                                  TextFormField(
                                                                      readOnly:
                                                                          true,
                                                                      controller:
                                                                          departmentIdTxt,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                      )),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .purple),
                                                                onPressed:
                                                                    () async {
                                                                  int? x = await DBHelper.database.studentDao.updatesStudent(Student(
                                                                      id: snapshot
                                                                          .data![
                                                                              index]
                                                                          .id!,
                                                                      name: nameTxt
                                                                          .text,
                                                                      email: emailTxt
                                                                          .text,
                                                                      phoneNo:
                                                                          phoneNoTxt
                                                                              .text,
                                                                      departmentId:
                                                                          int.parse(departmentIdTxt
                                                                              .text),
                                                                      active:
                                                                          true));
                                                                  nameTxt
                                                                      .clear();
                                                                  emailTxt
                                                                      .clear();
                                                                  phoneNoTxt
                                                                      .clear();
                                                                  departmentIdTxt
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
                                                          "Do you remove ${snapshot.data![index].name} Student",
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
                                                                  .studentDao
                                                                  .deleteStudent(
                                                                      snapshot
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
                                                                child:
                                                                    Text('No')))
                                                      ],
                                                    );
                                                  },
                                                );
                                                // int? x = await DBHelper
                                                //     .database.departmentDao
                                                //     .deleteDepartment(
                                                //         snapshot
                                                //             .data![index]
                                                //             .id!);
                                                // print(x);
                                                // setState(() {});
                                              },
                                              icon: Icon(Icons.delete)),
                                        ],
                                      ),
                                      Text(snapshot.data![index].name!),
                                      Text(snapshot.data![index].email!),
                                      Text(snapshot.data![index].phoneNo!),
                                      Text(snapshot.data![index].departmentId!
                                          .toString()),
                                      Text(snapshot.data![index].active!
                                          .toString()),
                                      // FutureBuilder(
                                      //   future: DBHelper.database.departmentDao
                                      //       .getAllDepartments(),
                                      //   builder: (context,
                                      //       AsyncSnapshot<List<Department>>
                                      //           snapshot) {
                                      //     int y = snapshot
                                      //         .data![index]
                                      //         .id!;
                                      //     bool z = x == y;
                                      //     // Student(
                                      //     //     departmentId:
                                      //     //         snapshot.data![index].id);
                                      //     return x == y
                                      //         ? Text(snapshot.data![index].name!)
                                      //         : Text('No Selected Department');
                                      //   },
                                      // )

                                      // Text(snapshot.data![index].active!.toString()),
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
    );
  }
}
