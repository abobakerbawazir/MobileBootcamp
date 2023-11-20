import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/day_floor/Database/db_helper.dart';
import 'package:flutter_application_2/day_floor/Entites/student.dart';

class StudentDeatialPage extends StatefulWidget {
  const StudentDeatialPage({super.key});

  @override
  State<StudentDeatialPage> createState() => _StudentDeatialPageState();
}

class _StudentDeatialPageState extends State<StudentDeatialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Deatial Page"),
      ),
      body: FutureBuilder(
        future: DBHelper.database.studentDao.getAllStudents(),
        builder: (context, AsyncSnapshot<List<Student>> snapshot) {
          if (snapshot.hasData) {
            return Text("data");
          }
          return Text("No Data Avaliable");
        },
      ),
    );
  }
}
