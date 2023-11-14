import 'package:day_48_exercise/day52/ConstantAPI_folder/Constant_API.dart';
import 'package:day_48_exercise/day52/Model/BlogsModel.dart';
import 'package:dio/dio.dart';

class BlogsController {
  Future<List<Blogs>> getBlogs() async {
    try {
      Dio d = Dio();
      Response serverResponse = await d.get(API_URL.Blogs_URL);
      List<Blogs>? BlogsList =
          (serverResponse.data as List).map((e) => Blogs.fromJson(e)).toList();
      print(serverResponse);
      return BlogsList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> postBlogs(Blogs blogs) async {
    Dio dd = Dio();
    print(blogs.title);
    Response serverResponse =
        await dd.post(API_URL.Blogs_URL, data: blogs.toJson());
    if (serverResponse.statusCode == 201) {
      print(serverResponse.data);
      return true;
    } else {
      return false;
    }
  }
  Future<bool> putBlogs(Blogs blogs,int index) async {
    Dio dd = Dio();
    print(blogs.title);
    Response serverResponse =
        await dd.put(API_URL.Blogs_URL+"/${index+1}", data: blogs.toJson());
    if (serverResponse.statusCode == 201) {
      print(serverResponse.data);
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteBlogs(int index) async {
    Dio dd = Dio();
    //print(blogs.title);
    Response serverResponse =
        await dd.delete(API_URL.Blogs_URL+"/${index+1}");
    if (serverResponse.statusCode == 201) {
      print(serverResponse.data);
      return true;
    } else {
      return false;
    }
  }
}
