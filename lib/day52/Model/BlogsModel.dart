class Blogs {
  String? title;
  String? content;
  String? id;

  Blogs({required this.title,required this.content,required this.id});

  Blogs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['id'] = this.id;
    return data;
  }
}