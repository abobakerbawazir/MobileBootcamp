import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/firestore_day80Task/Models/BaseModel.dart';
import 'package:firebase_app/firestore_day80Task/Models/Student.dart';

class StudentVM {
  FirebaseFirestore dbObjectFirebaseFirestore = FirebaseFirestore.instance;

  static Map<String, dynamic> addClollectioForObject(BaseModel chieldModel) {
    return chieldModel.toJson();
  }

  List<Student> allStudents = [];
  Future<QuerySnapshot<Map<String, dynamic>>> getStudents() {
    return dbObjectFirebaseFirestore.collection('Students').get();
  }

  Future<List<Student>> loadStudents() async {
    QuerySnapshot query =
        await dbObjectFirebaseFirestore.collection('Students').get();
    List<QueryDocumentSnapshot> documents = query.docs;
    allStudents = documents
        .map((e) => Student.fromJsonAndDocumentId(
            json: e.data() as Map<String, dynamic>, documentId: e.id))
        .toList();
    return allStudents;
  }
}
