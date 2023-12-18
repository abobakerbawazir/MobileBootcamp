import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/firestore_day80Task/Models/Student.dart';
import 'package:firebase_app/firestore_day80Task/ViewModel/StudentVM.dart';
import 'package:flutter/material.dart';

class Home80Page extends StatefulWidget {
  const Home80Page({super.key});

  @override
  State<Home80Page> createState() => _Home80PageState();
}

class _Home80PageState extends State<Home80Page> {
  Student student = Student();
  FirebaseFirestore dbObjectFirebaseFirestore = FirebaseFirestore.instance;
  TextEditingController nameTXt = TextEditingController();
  TextEditingController emailTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                    controller: nameTXt,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                TextFormField(
                    controller: emailTxt,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                TextFormField(
                    controller: phoneTxt,
                    decoration: InputDecoration(
                        hintText: 'Phone',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                ElevatedButton(
                    onPressed: () async {
                      await dbObjectFirebaseFirestore
                          .collection('Students')
                          .add(StudentVM.addClollectioForObject(Student(
                              email: emailTxt.text,
                              name: nameTXt.text,
                              phone: phoneTxt.text)))
                          .whenComplete(
                        () {
                          nameTXt.clear();
                          phoneTxt.clear();
                          emailTxt.clear();
                        },
                      ).catchError(() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Feailde")));
                      });
                    },
                    child: Text("Save")),
                ElevatedButton(
                    onPressed: () async {
                     
                      await dbObjectFirebaseFirestore
                          .collection('Students')
                          .doc("AllbHTo23B3L76PLyscfgh1L")
                          .update({"name":"Abobaker"})
                          .whenComplete(
                        () {
                          nameTXt.clear();
                          phoneTxt.clear();
                          emailTxt.clear();
                        },
                      ).catchError(() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Feailde")));
                      });
                    },
                    child: Text("Update")),SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
