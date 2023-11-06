import 'package:day_48_exercise/Exercise49/Core/API_URL_Constant/API_URL.dart';
import 'package:day_48_exercise/Exercise49/Featueres/Model/ProductsModel.dart';
import 'package:dio/dio.dart';

class CategoryController {
  Future<List<String>> getCategory() async {
    try {
      Dio d = Dio();
      Response serverResponse = await d.get(APIURL.categryURL);
      List<String>? CategoryList =
          (serverResponse.data as List).map<String>((e) => e).toList();
      print(serverResponse);
      return CategoryList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
