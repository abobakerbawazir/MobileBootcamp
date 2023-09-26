import 'SocialMediaPost.dart';
import 'Website1PostAdapter.dart';
import 'Website2PostAdapter.dart';

class PostProcessor {
  List<SocialMediaPost> processPosts(List<Map<String, dynamic>> website1Posts,List<Map<String, dynamic>> website2Posts) {
    // Create an empty list to store the adapted posts.
    List<SocialMediaPost> adaptedPosts = [];
    // loop over the list of maps for each website1Posts,
    // create the appropriate adapter object(Website1PostAdapter(post['headline'], post['text'])),
    // and add it to the adapted posts list (adaptedPosts).

    for (var post in website1Posts) {
      var adapter = Website1PostAdapter(post['headline'], post['text']);
      adaptedPosts.add(adapter);
    }

    for (var post in website2Posts) {
      var adapter = Website2PostAdapter(post['header'], post['body']);
      adaptedPosts.add(adapter);
    }

    return adaptedPosts;
  }
}
