import 'package:flutter/material.dart';
import 'package:flutter_application_2/day_58_storeage_get/HomeGetScreen.dart';
import 'package:flutter_application_2/day_floor/Database/db_helper.dart';
import 'package:flutter_application_2/day_floor/Entites/department.dart';
import 'package:flutter_application_2/day_floor/Entites/student.dart';
import 'package:flutter_application_2/day_floor/Views/Screens/DepHomePage.dart';
import 'package:flutter_application_2/day_floor/Views/Screens/HomePageScreen.dart';
import 'package:flutter_application_2/day_floor/Views/Screens/StudentHomePage.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await DBHelper.initDatabase();
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App', home: StudentHomePage(),
      // Scaffold(
      //     floatingActionButton: FloatingActionButton(
      //       onPressed: () async {
      //         int x = await DBHelper.database.studentDao.addStudent(Student(
      //             name: 'ahmed',
      //             email: 'Ahmed@gmail.com',
      //             phoneNo: '775630183',
      //             departmentId: 1));
      //         print(x);
      //         setState(() {

      //         });
      //       },
      //     ),
      //     appBar: AppBar(
      //       title: const Text('Material App Bar'),
      //     ),
      //     body: SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           SizedBox(height: MediaQuery.of(context).size.height/2,
      //             child: FutureBuilder(
      //               future: DBHelper.database.studentDao.getAllStudents(),
      //               builder: (context, AsyncSnapshot<List<Student>> snapshot) {
      //                 if (snapshot.hasData) {
      //                   return snapshot.data!.isEmpty
      //                       ? Center(child: Text("Empty"))
      //                       : ListView.builder(
      //                           itemCount: snapshot.data!.length,
      //                           itemBuilder: (context, index) {
      //                             return Text(snapshot.data![index].name!);
      //                           },
      //                         );
      //                 } else {
      //                   return Text("data is no");
      //                 }
      //               },
      //             ),
      //           ),
      //           SizedBox(height: MediaQuery.of(context).size.height/2,
      //             child: FutureBuilder(
      //               future: DBHelper.database.departmentDao.getAllDepartments(),
      //               builder: (context, AsyncSnapshot<List<Department>> snapshot) {
      //                 if (snapshot.hasData) {
      //                   return snapshot.data!.isEmpty
      //                       ? Center(child: Text("Empty"))
      //                       : ListView.builder(
      //                           itemCount: snapshot.data!.length,
      //                           itemBuilder: (context, index) {
      //                             return Text(snapshot.data![index].name!);
      //                           },
      //                         );
      //                 } else {
      //                   return Text("data is no");
      //                 }
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //     )),
    );
  }
}
