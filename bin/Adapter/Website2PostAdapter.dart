import 'SocialMediaPost.dart';

class Website2PostAdapter implements SocialMediaPost {
  String header;
  String body;

  Website2PostAdapter(this.header, this.body);

  @override
  String getTitle() {
    return header;
  }

  @override
  String getContent() {
    return body;
  }
}