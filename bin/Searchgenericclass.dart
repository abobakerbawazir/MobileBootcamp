import 'Category.dart';
import 'Medicine.dart';

class Searchgeneric<T> {
  Searchgeneric();
  search(List<Medicine> list, dynamic keyword, {String? operatorT}) {
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
