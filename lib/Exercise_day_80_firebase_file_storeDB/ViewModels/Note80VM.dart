import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Exercise_day_80_firebase_file_storeDB/Models/Note80.dart';
import 'package:firebase_app/Exercise_day_80_firebase_file_storeDB/enum/enumStates.dart';
import 'package:flutter/material.dart';

class Note80VM with ChangeNotifier {
  Note80VM() {}
  FirebaseFirestore dbObjectFirebaseFirestore = FirebaseFirestore.instance;

  status? selectedValue;
  List<status> listStatues = status.values;
  List<Note> _allNote = [];
  List<int> disableOptions = [];
  List<Note> get allNote => _allNote;
  Map<String, dynamic> addClollectioForStudent(Note note) {
    notifyListeners();
    return note.toJson();
  }

  Future<List<Note>> loadNotes() async {
    QuerySnapshot query =
        await dbObjectFirebaseFirestore.collection('Notes').get();
    List<QueryDocumentSnapshot> documents = query.docs;
    _allNote = documents
        .map((e) => Note.fromJsonAndDocumentId(
            json: e.data() as Map<String, dynamic>, documentId: e.id))
        .toList();
    notifyListeners();
    return _allNote;
  }

  updateStates(String statues, int index) {
    allNote[index].status = statues;
    notifyListeners();
  }
}
