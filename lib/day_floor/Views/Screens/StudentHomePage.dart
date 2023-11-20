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
              departmentId: 1));
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
              child: TextFormField(
                  controller: nameTxt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Student Name',
                  )),
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
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                  controller: phoneNoTxt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Student Phone',
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              child: FutureBuilder(
                future: DBHelper.database.departmentDao.getAllDepartments(),
                builder: (context, AsyncSnapshot<List<Department>> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.isEmpty
                        ? Center(child: Text("Empty"))
                        : DropdownButton(
                            value: type,
                            items: snapshot.data!.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.name.toString()),
                                value: item.id,
                              );
                            }).toList(),
                            onChanged: (newvalue) {
                              type = newvalue!;
                              departmentIdTxt.text = type!.toString();

                              setState(() {});
                            },
                          );
                  } else {
                    return Text("data is no");
                  }
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                  readOnly: true,
                  controller: departmentIdTxt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
            ),
            ElevatedButton(
                onPressed: () async {
                  Student s = Student(
                      name: nameTxt.text,
                      email: emailTxt.text,
                      phoneNo: phoneNoTxt.text,
                      departmentId: int.parse(departmentIdTxt.text));
                  int x = await DBHelper.database.studentDao.addStudent(s);
                  print(x);
                },
                child: Text("Add Student")),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: FutureBuilder(
                future: DBHelper.database.studentDao.getAllStudents(),
                builder: (context, AsyncSnapshot<List<Student>> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.isEmpty
                        ? Center(child: Text("Empty "))
                        : ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Text(snapshot.data![index].name!);
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
