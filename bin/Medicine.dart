//Medicine ادوية
import 'dart:math';

import 'Category.dart';
import 'Searchgenericclass.dart';
import 'suppliers.dart';

class Medicine implements Searchgeneric{
  late int id;
  late String name, expireDate;
  late double unitPrice;
  late Category category;
  late Suppliers suppliers;

  Medicine.Medicine(
      {required this.name,
      required this.unitPrice,
      required this.category,
      required this.expireDate,
      required this.suppliers}) {
    Random r = Random();
    this.id = r.nextInt(1000) + 1;
    this.name = name;
    this.unitPrice = unitPrice;
    this.category = category;
    this.expireDate = expireDate;
    this.suppliers = suppliers;
  }
  displayMedicines(List<Medicine> m) {
    m.forEach((element) {
      print(element.id);
      print(element.name);
      print(element.expireDate);
      print(element.unitPrice);
      print(element.category.name);
      print(element.suppliers.name);
    });
  }
  
  @override
  search(List<Medicine> list, keyword, {String? operatorT}) {
    if (operatorT == ">" && keyword >= 4000) {
      list.forEach((element) {
        print(element.id);
        print(element.name);
        print(element.unitPrice);
        print(element.category.name);
        print(element.expireDate);
        print(element.suppliers.name);
      });
    }

    if (operatorT == "Categories") {
      list.forEach((element) {
        print(element.category.name);
      });
    }
    if (operatorT == "Category4") {
      list.forEach((element) {
        if (element.category.name == "Category4") {
          print(element.category.name);
        }
      });
    }
    if (operatorT == "Medincy4") {
      list.forEach((element) {
        if (element.name.contains("4")) {
          print(element.id);
          print(element.name);
          print(element.unitPrice);
          print(element.category.name);
          print(element.expireDate);
          print(element.suppliers.name);
        }
      });
    }
  }
}
