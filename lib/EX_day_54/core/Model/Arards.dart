class ModelAward {
  int? id;
  String? name;
  int? id_actor;
  ModelAward({this.id, this.name, this.id_actor});
  ModelAward.fromJson(Map<String, dynamic> json) {
    id_actor = json['id_actor'];
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['id_actor'] = this.id_actor;
    return data;
  }
}
