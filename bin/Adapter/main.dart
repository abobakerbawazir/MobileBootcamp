import 'PostProcessor.dart';

void main() {
  // Retrieve the posts from list of map website1Posts
  List<Map<String, dynamic>> website1Posts = [
    {
      'headline': 'Task1 of Website 1 Post 1',
      'text': 'This is the content of Website 1 Post 1.',
    },
    {
      'headline': 'Task2 of Website 1 Post 2',
      'text': 'This is the content of Website 1 Post 2.',
    },
  ];

  List<Map<String, dynamic>> website2Posts = [
    {
      'header': 'Task1 of Website 2 Post 1',
      'body': 'This is the content of Website 2 Post 1.',
    },
    {
      'header': 'Task2 of 3 Website 2 Post 2',
      'body': 'This is the content of Website 2 Post 2.',
    },
  ];

 
  var postProcessor = PostProcessor();

  
  var adaptedPosts = postProcessor.processPosts(website1Posts, website2Posts);

  
  for (var post in adaptedPosts) {
    print('Title: ${post.getTitle()}');
    print('Content: ${post.getContent()}');
    print('=================================================');
  }
}