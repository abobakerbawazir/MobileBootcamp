import 'package:flutter_application_2/constants/api_url.dart';
import 'package:flutter_application_2/core/models/product.dart';
import 'package:flutter_application_2/core/repositories/products_repo.dart';
import 'package:flutter_application_2/helper/database_manager.dart';


class ProductViewModel{
  List<Product>_allProducts=[];
  Future<List<Product>>fetchProducts(ProductsRepo productsRepo,String API_URLName)async{
    List<dynamic> products=await productsRepo.getProducts(API_URLName);

    print(products);

    try {
      _allProducts = products.map((e) => Product.fromJson(e)).toList();
    }catch(ex) {
      print("the exception is $ex");
    }
      return _allProducts;

  }


  Future<int> addProduct(ProductsRepo productsRepo,Product p)async{
   return await  productsRepo.storeProduct(DBManger.TBL_PRODUCTS,p);
  }
}