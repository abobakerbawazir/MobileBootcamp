import 'package:day_48_exercise/day52/ConstantAPI_folder/Constant_API.dart';
import 'package:day_48_exercise/day52/Model/CommentsModel.dart';
import 'package:dio/dio.dart';

class CommentsController {
  Future<List<CommentsModel>> getComments(String index) async {
    try {
      Dio d = Dio();
      Response serverResponse = await d.get(API_URL.Blogs_URL+index+'/comments');
      List<CommentsModel>? CommentsList =
          (serverResponse.data as List).map((e) => CommentsModel.fromJson(e)).toList();
      print(serverResponse);
      return CommentsList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // Future<List<String>> getComments(String a) async {
  //   try {
  //     // Dio d = DioConnection.connect();
  //     Dio d = Dio();
  //     Response serverResponse =
  //         await d.get(API_URL.Comments_URL + a + '/comments');
  //     List<String>? CommentsList =
  //         (serverResponse.data as List).map<String>((e) => e).toList();
  //     print(serverResponse);
  //     return CommentsList;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }
}
