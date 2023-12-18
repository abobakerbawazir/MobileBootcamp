class Note {
  String? id;
  String? title;
  String? description;
  String? status;
  Note({
    this.id,
    this.title,
    this.description,
    this.status,
  });
  Note.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    status = json['status'];
  }
  Note.fromJsonAndDocumentId(
      {required Map<String, dynamic> json, required String documentId}) {
    title = json['title'];
    description = json['description'];
    status = json['status'];
    id = documentId;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
  
}
