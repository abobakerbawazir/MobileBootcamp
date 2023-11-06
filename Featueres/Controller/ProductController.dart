import 'package:day_48_exercise/Exercise49/Core/API_URL_Constant/API_URL.dart';
import 'package:day_48_exercise/Exercise49/Featueres/Model/ProductsModel.dart';
import 'package:dio/dio.dart';

class ProductController {
  Future<List<Products>> getPoduct(String a) async {
    try {
      Dio d = Dio();
      Response serverResponse = await d.get(APIURL.passCategory+a);
      List<Products>? ProductsList = (serverResponse.data as List)
          .map((e) => Products.fromJson(e))
          .toList();
      print(serverResponse);
      return ProductsList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
