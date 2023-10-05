class HotelModel {
  int? id;
  String? title;
  String? description;
  String? thumbnail;

  HotelModel(
      {this.id,
        this.title,
        this.description,
        this.thumbnail});

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}