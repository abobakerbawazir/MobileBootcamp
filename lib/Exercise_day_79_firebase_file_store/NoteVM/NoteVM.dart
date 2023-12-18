import 'package:firebase_app/Exercise_day_79_firebase_file_store/Models/Note.dart';
import 'package:firebase_app/Exercise_day_79_firebase_file_store/Screens/enum/enumStatus.dart';
import 'package:flutter/material.dart';

class NoteVM with ChangeNotifier {
  NoteVM() {}
  status? selectedValue;
  List<status> listStatues = status.values;
  List<Note> _allNote = [
    Note(id: 1, title: "title1", description: "description1", status: "Done"),
    Note(id: 2, title: "title2", description: "description2", status: "Done"),
    Note(id: 3, title: "title3", description: "description3", status: "Done")
  ];
  List<Note> get allNote => _allNote;

  addNote(Note note) {
    _allNote.add(note);
    notifyListeners();
  }

  deleteNote(Note note) {
    _allNote.remove(note);
    notifyListeners();
  }

  updateNote(String title, String description, int index) {
    {
      allNote[index].title = title;
      allNote[index].description = description;

      notifyListeners();
    }
  }

  updateStates(String statues, int index) {
    allNote[index].status = statues;
    notifyListeners();
  }

  updateNoteByObject(Note note, int index) {
    {
      allNote[index].title = note.title;
      allNote[index].description = note.description;

      notifyListeners();
    }
  }
}
