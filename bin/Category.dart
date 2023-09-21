import 'Medicine.dart';
import 'Searchgenericclass.dart';

class Category implements Searchgeneric{
  late String name;
  Category({required this.name});
  PrintCategory() {
    print(name);
  }

  displayCategory(List<Category> c) {
    c.forEach((element) {
      print(element.name);
    });
  }

  @override
  search(List<Medicine> list, keyword, {String? operatorT}) {
    list.forEach((element) {
        print(element.category.name);
      });
  }
}
