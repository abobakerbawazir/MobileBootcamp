import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/models/product.dart';
import 'package:flutter_application_2/core/repositories/products_repo.dart';
import 'package:flutter_application_2/helper/database_manager.dart';


class LocalProductsRepo extends ProductsRepo {
  @override
  Future<List<dynamic>> getProducts(String API_URL_NAME) async {
    DBManger dbManger = DBManger();
    return await dbManger.fetch("select * from products");
  }

  @override
  storeProduct(String source, data) {
    Product p = data as Product;
    DBManger dbManger = DBManger();
    Map<String, dynamic> prodcutRow = p.toJson();
    List<Map<String, dynamic>> sub_images = [];
    p.images!.forEach((element) {
      Map<String, dynamic> img = Map();
      img[DBManger.COL_IMAGE] = element;
      sub_images.add(img);
    });
    prodcutRow.remove("images");
    return dbManger.insert(source, prodcutRow,
        foreignTable: DBManger.TBL_IMAGES, sub_rows: sub_images);
  }
}
