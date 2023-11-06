// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelDepartMent {
  String? name;
  bool? active;
  String? id;

  ModelDepartMent({this.name, this.active, this.id}) {
    active = false;
  }

  ModelDepartMent.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    active = json['active'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['active'] = this.active;
    data['id'] = this.id;
    return data;
  }
}
