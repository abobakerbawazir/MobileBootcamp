import 'package:firebase_app/firestore_day80Task/Models/BaseModel.dart';

class Student implements BaseModel {
  String? id;
  String? name;
  String? email;
  String? phone;

  Student({this.id, this.name, this.email, this.phone});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
  Student.fromJsonAndDocumentId(
      {required Map<String, dynamic> json, required String documentId}) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = documentId;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
