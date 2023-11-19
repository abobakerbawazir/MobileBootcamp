
import 'package:dio/dio.dart';
import 'package:flutter_application_2/constants/api_url.dart';
import 'package:flutter_application_2/core/repositories/products_repo.dart';

class OnlineProductsRepo extends ProductsRepo{
  Dio d=Dio();
  @override
 Future<List<dynamic>> getProducts(String API_URL_NAME) async{
      Response serverResponse=await d.get(API_URL_NAME);
      return serverResponse.data["products"];



  }

  @override
  storeProduct(String source, data) {

  }





}