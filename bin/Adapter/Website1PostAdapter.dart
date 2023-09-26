import 'SocialMediaPost.dart';

class Website1PostAdapter implements SocialMediaPost {
  String headline;
  String text;

  Website1PostAdapter(this.headline, this.text);

  @override
  String getTitle() {
    return headline;
  }

  @override
  String getContent() {
    return text;
  }
}