import 'package:mvc_flutter/Exerciseday42/Model/PostModel.dart';
import 'package:mvc_flutter/MVC/Model/OrderModel.dart';
import 'package:mvc_flutter/databaes/DatabaseOB.dart';
import 'package:mvc_flutter/main.dart';

class PostController {
  late Post post;
  late List<Post> allPosts;
  Future<List<Post>> fatchPosts() async {
   // await Future.delayed(Duration(seconds: 5));

    allPosts = await cgetfileContent() ;
    print(allPosts);
    return allPosts;
    //return null;
  }
}
