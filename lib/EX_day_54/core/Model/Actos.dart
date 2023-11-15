class ModelActors {
  int? id;
  String? name;
  ModelActors({this.id, this.name});
  ModelActors.fromJson(Map<String, dynamic> json) {
    id = json['id']??null;
    name = json['name']??"a";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
