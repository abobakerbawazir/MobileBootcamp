import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/day_floor/Views/Screens/CourseHomePage.dart';
import 'package:flutter_application_2/day_floor/Views/Screens/DepHomePage.dart';
import 'package:flutter_application_2/day_floor/Views/Screens/RegCourseHomePage.dart';
import 'package:flutter_application_2/day_floor/Views/Screens/StudentHomePage.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePageScreen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 33, 243)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DepartmentHomePage();
                      },
                    ));
                  },
                  child: Center(child: Text("Department Home Page"))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 33, 243)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return StudentHomePage();
                      },
                    ));
                  },
                  child: Center(child: Text("Student Home Page"))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 33, 243)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CourseHomePage();
                      },
                    ));
                  },
                  child: Center(child: Text("Course Home Page"))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 33, 243)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return RegCourseHomePage();
                      },
                    ));
                  },
                  child: Center(child: Text("Reg Course Home Page")))
            ],
          ),
        ),
      ),
    );
  }
}
